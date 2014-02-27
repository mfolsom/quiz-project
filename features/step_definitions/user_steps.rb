Given(/^I am on the sign up page$/) do
  visit new_user_path
end

Given(/^I am on the sign in page$/) do
  visit sign_in_path
end

When(/^I fill in the the sign up form$/) do
  fill_in("user[username]", with: "ecomba")
  fill_in("user[email]",    with: "ecomba@makersacademy.com")
  fill_in("user[password]", with: "s3cr3t")
  fill_in("user[password_confirmation]", with: "s3cr3t")
end

When(/^I submit the sign up form with an incorrect password$/) do
  fill_in("user[username]",     with: "riepenhausen")
  fill_in("user[email]",        with: "riepenhausen@makersacademy.com")
  fill_in("user[password]",     with: "s3cr3t")
  fill_in("user[password_confirmation]", with: "wrongcret")
  click_button("Sign Up")
end

When(/^press "(.*?)"$/) do |button|
  click_button(button)
end

Then(/^I should be signed up$/) do
  user = User.find_by(username: "ecomba")
  expect(user.email).to eq("ecomba@makersacademy.com")
end

Then(/^I should not be signed up$/) do
  expect(User.find_by(username: "riepenhausen")).to be_nil
end

Then(/^I should see a welcome message$/) do
  expect(page).to have_content("Welcome ecomba!")
end

Then(/^I should be on the sign up page$/) do
  expect(current_path).to eq(new_user_path)
end

Given(/^I have already signed up(?: with a username| with an email address|)$/) do
  visit new_user_path
  fill_in("user[username]", with: "ecomba")
  fill_in("user[email]",    with: "ecomba@makersacademy.com")
  fill_in("user[password]", with: "s3cr3t")
  fill_in("user[password_confirmation]", with: "s3cr3t")
  click_button("Sign Up")
end

Given(/^I am signed in$/) do
  visit sign_in_path
  fill_in("username", with: "ecomba")
  fill_in("password", with: "s3cr3t")
  click_button("Sign In")
end

When(/^another user tries to sign up with that username again$/) do
  visit new_user_path
  fill_in("user[username]", with: "ecomba")
  fill_in("user[email]",    with: "ecomba1@makersacademy.com")
  fill_in("user[password]", with: "s3cr3t")
  fill_in("user[password_confirmation]", with: "s3cr3t")
  click_button("Sign Up")
end

Then(/^that user should not be signed up$/) do
  expect(User.find_by(email: "ecomba1@makersacademy.com")).to be_nil
end

When(/^another user tries to sign up with my email address$/) do
  visit new_user_path
  fill_in("user[username]", with: "ecomba1")
  fill_in("user[email]",    with: "ecomba@makersacademy.com")
  fill_in("user[password]", with: "s3cr3t")
  fill_in("user[password_confirmation]", with: "s3cr3t")
  click_button("Sign Up")
end

Then(/^the fraudulent user should not be signed up$/) do
  expect(User.find_by(username: 'ecomba1')).to be_nil
end

When(/^I submit the sign up form without an email address$/) do
  fill_in("user[username]",     with: "riepenhausen")
  fill_in("user[password]",     with: "s3cr3t")
  fill_in("user[password_confirmation]", with: "s3cr3t")
  click_button("Sign Up")
end

Then(/^I shouldn't exist$/) do
  expect(User.find_by(email:'riepenhausen@makersacademy.com')).to be_nil
end

When(/^I submit the sign up form without a username$/) do
  fill_in("user[email]",    with: "riepenhausen@makersacademy.com")
  fill_in("user[password]",     with: "s3cr3t")
  fill_in("user[password_confirmation]", with: "s3cr3t")
  click_button("Sign Up")
end

When(/^I fill in my details$/) do
  fill_in("username", with: "ecomba")
  fill_in("password", with: "s3cr3t")
end

When(/^I fill in my details with an invalid password$/) do
   fill_in("username", with: "ecomba")
   fill_in("password", with: "secret")
end

When(/^I fill in my details with an invalid username$/) do
  fill_in("username", with: "riepenhausen")
  fill_in("password", with: "s3cr3t")
end

Then(/^I should be on the sign in page$/) do
   expect(current_path).to eq(sign_in_path)
end


