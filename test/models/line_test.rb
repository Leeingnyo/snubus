require 'test_helper'

class LineTest < ActiveSupport::TestCase
  test "Lines are available" do
    assert Line.find_by(:name => "관악02")
    assert Line.find_by(:name => "5511")
    assert Line.find_by(:name => "5513")
    assert Line.find_by(:name => "5516")
  end
end
