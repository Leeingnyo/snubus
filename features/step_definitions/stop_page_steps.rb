When /^I click stop "(\w+)" button$/ do |stop_id|
  click_button("stop-#{stop_id}")
end

When /^I click stop page button$/ do
  click_button("show-stop-info")
end

Then /^I am on 공대입구 page$/ do
  assert(page.has_content?("공대입구"))
end
