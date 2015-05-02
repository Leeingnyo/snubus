class Line < ActiveRecord::Base
  validates_uniqueness_of :line_id
end
