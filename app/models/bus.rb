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

  def self.valid?
    return !@@last_update_time.nil? &&
           Time.now - @@last_update_time < UPDATE_CYCLE
  end

  def self.update
    #TODO: Remove all entries and add new entries.

    @@last_update_time = Time.now
  end
end
