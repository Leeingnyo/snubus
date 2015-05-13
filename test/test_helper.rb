require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def add_buses
    Edge.all.each do |edge|
      if(edge.edge_index % 2 == 1)
        next
      end

      new_bus = Bus.create({:line_id => edge.line_id, :edge => edge,
                            :time => 60})
    end
  end
end
