When /^I click set departure button$/ do
  click_button("set-departure")
end

When /^I click set destination button$/ do
  click_button("set-destination")
end

Then /^departure is 공대입구$/ do
  assert(find("input[name=departure-name]").value == "공대입구")
end

Then /^destination is 공동기기원$/ do
  assert(find("input[name=destination-name]").value == "공동기기원")
end
