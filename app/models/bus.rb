class Bus < ActiveRecord::Base
  def self.validate
    if valid?
      return
    end

    update
  end

  def self.coming_buses edge
    validate

    where(:line_id => edge.line_id).where("index <= #{edge.index}").order(:index => :desc)
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
