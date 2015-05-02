class Stop < ActiveRecord::Base
  validates_uniqueness_of :stop_id
end
