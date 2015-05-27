Given /^I am on main page$/ do
  visit("/")
end

Then /^I can see stop "(\w+)" button$/ do |stop_id|
  assert(page.has_button?("stop-#{stop_id}"))
end
