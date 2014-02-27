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

Given(/^I am on the new question page$/) do
  visit new_question_path
end

Given(/^I fill in the form$/) do
  fill_in("question[text]", :with => "Is a bushel a unit of measure?")
  choose('question_answer_false')
end

When(/^I create a question$/) do
  visit new_question_path
  fill_in("question[text]", :with => "Is a bushel a unit of measure?")
  choose('question_answer_false')
end

Then(/^the question should be in the database$/) do
  @new_question = Question.find_by(text: "Is a bushel a unit of measure?")
  expect(@new_question.answer).to be_false
end

Then(/^I should be the author of that question$/) do
  question = Question.find_by(text: "Is a bushel a unit of measure?")
  expect(question.author).to eq("ecomba")
end

Then(/^I should see "(.*?)""$/) do |content|
  expect(page).to have_content(content)
end

Then(/^I should not see "(.*?)"$/) do |content|
  expect(page).not_to have_content(content)
end

Given(/^I am not logged in$/) do
end

Then(/^I should not see any questions$/) do
  expect(page).not_to have_content("?")
end

Given(/^there are no questions in the database$/) do
  Question.destroy_all
end