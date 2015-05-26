require 'net/http'
require 'nokogiri'
require 'json'

class Bus < ActiveRecord::Base
  belongs_to :edge

  def self.validate
    if valid?
      return
    end

    update
  end

  def self.coming_buses edge
    validate

    joins(:edge).where("edges.line_id = #{edge.line_id}").where("edge_index <= #{edge.edge_index}").order("edge_index DESC")
  end

  private

  UPDATE_CYCLE = 30

  @@last_update_time = nil
  @@line_id_list = [4551100, 4551300, 4551600, 3920400]

  def self.valid?
    return !@@last_update_time.nil? &&
           Time.now - @@last_update_time < UPDATE_CYCLE
  end

  def self.update
    # Do not update buses.
    # Use static fixture data for testing.
    if Rails.configuration.x.should_not_update_buses == true
      return
    end

    Bus.destroy_all

    @@line_id_list.each do |id|
      response = get_pos_info(id)
      if response == nil
        #TODO: API error
      end
      if id != 3920400
        result = Nokogiri::XML(response)

        if result.xpath("//headerMsg").first.to_s.include? "정상적으로 처리되었습니다"
          result = Nokogiri::XML(response)
          items = result.xpath("//itemList")
          items.each do |item|
            sectOrd = item.css("sectOrd").first.content.to_i - 1
            # TODO: Should get correct nextStTm.
            #nextStTm = item.css("nextStTm").first.content.to_i / 2
            nextStTm = 60
            e = Edge.find_by(:line_id => id.to_s, :edge_index => sectOrd)
            if e
              eid = e.id
              bus = Bus.new({:line_id => id.to_s, :edge_id => eid, :time => nextStTm})
              bus.save
            end
          end
        end
      else
	result = JSON.parse response
	result['resultList'].each do |r|
	  if r['isFullFlag']
	    sectOrd = r['seq'].to_i - 1
	    nextStTm = 60
	    e = Edge.find_by(:line_id => id.to_s, :edge_index => sectOrd)
	    if e
	      eid = e.id
	      bus = Bus.new({:line_id => id.to_s, :edge_id => eid, :time => nextStTm})
	      bus.save
	    end
	  end
	end
      end
    @@last_update_time = Time.now
    end
  end

  def self.get_pos_info(id)
    if (id.is_a? Integer) && (id != 3920400)
      uri = URI('http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?busRouteId=' + id.to_s)
      req = Net::HTTP::Get.new uri
      req['serviceKey'] = 'QBa3t29yVh9iQwxdzTAcgWzNNPFUYCi/ca0hYcLZLVxktIl6ACG+zClU+NlTiZL2RYc5QW87O/rZJ3vtjk0Afw=='
      response = Net::HTTP.start(uri.host, uri.port) do |http|
        http.request(req)
      end
      return response.body
    elsif id == 3920400
      uri = URI.parse('http://m.bus.go.kr')
      http = Net::HTTP.new(uri.host, uri.port)
      req = Net::HTTP::Post.new('/mBus/bus/getRouteAndPos.bms')
      req.add_field('Content-Type', 'application/x-www-form-urlencoded')
      req.body = "busRouteId=3920400"
      response = http.request(req)
      return response.body
    else
      return nil
    end
  end
end
