When(/^I am on the statistics page$/) do
  visit stats_path
end

Then(/^I should see the number of questions$/) do
  expect(page).to have_content("There are")
  expect(page).to have_content("6")
  expect(page).to have_content("questions")
end