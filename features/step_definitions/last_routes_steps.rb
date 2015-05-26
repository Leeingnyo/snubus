Given /^I am on main page$/ do
  visit("/")
end

When /^I click last search button$/ do
  click_button("last-routes-button")
end

Then /^I am on last routes page$/ do
  assert(page.has_content?("최근 검색 기록"))
end
