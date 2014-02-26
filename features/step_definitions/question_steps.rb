Given(/^I am on the page for the blue sky question$/) do
  visit question_path(1)
end

Given(/^I complete a question$/) do
  click_button("True")
end

When(/^I press "(.*?)"$/) do |button_name|
  click_button(button_name) 
end

When(/^I click "(.*?)"$/) do |link_name|
  click_link(link_name)
end

When(/^I am on the homepage$/) do
  visit '/'
end

Then(/^I should see "([^\"]*)"$/) do |content|
  if page.respond_to? :should
    page.should have_content(content)
  else
    assert page.has_content?(content)
  end
end

Then(/^I should see the first question$/) do
  @question = Question.first
  expect(page).to have_content(@question.text)
end

Then(/^I should be on the homepage$/) do
  expect(current_path).to eq(root_path)
end

Then(/^I should not see the question I just answered$/) do
  @question = Question.first
  expect(page).not_to have_content(@question.text)
end