require 'net/http'
require 'nokogiri'

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
  @@line_id_list = [4551100, 4551300, 4551600]

  def self.valid?
    return !@@last_update_time.nil? &&
           Time.now - @@last_update_time < UPDATE_CYCLE
  end

  def self.update
    #TODO: Remove all entries and add new entries.
    Bus.destroy_all

    @@line_id_list.each do |id|
      response = get_pos_info(id)
      if response == nil
        #TODO: API error
      end
      result = Nokogiri::XML(response)

      if result.xpath("//headerMsg").first.to_s.include? "정상적으로 처리되었습니다"
	#TODO: handle results
        result = Nokogiri::XML(response)
        items = result.xpath("//itemList")
        items.each do |item|
          sectOrd = item.css("sectOrd").first.content.to_i - 1
          nextStTm = item.css("nextStTm").first.content.to_i / 2
          e = Edge.find_by(:line_id => id.to_s, :edge_index => sectOrd)
          if e
            eid = e.id
            bus = Bus.new({:line_id => id.to_s, :edge_id => eid, :time => nextStTm})
            bus.save
          end
        end
      else
        #TODO: FAIL TO GET RIGHT RESULT
      end
    end

    @@last_update_time = Time.now
  end

  def self.get_pos_info(id)
    if id.is_a? Integer
      uri = URI('http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?busRouteId=' + id.to_s)
      req = Net::HTTP::Get.new uri
      req['serviceKey'] = 'QBa3t29yVh9iQwxdzTAcgWzNNPFUYCi/ca0hYcLZLVxktIl6ACG+zClU+NlTiZL2RYc5QW87O/rZJ3vtjk0Afw=='
      response = Net::HTTP.start(uri.host, uri.port) do |http|
        http.request(req)
      end

      return response.body
    else
      return nil
    end
  end
end
