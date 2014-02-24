Given(/^I am on the page for the blue sky question$/) do
  visit question_path(1)
end

When(/^I press "(.*?)"$/) do |button_name|
  click_button(button_name)
end

Then(/^I should see "([^\"]*)"$/) do |content|
  if page.respond_to? :should
    page.should have_content(content)
  else
    assert page.has_content?(content)
  end
end