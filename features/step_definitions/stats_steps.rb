Given(/^there are a number of other users who have answered questions$/) do
  q1, q2, q3, q4, q5, q6 = Question.find(1), Question.find(2), Question.find(3), Question.find(4), Question.find(5), Question.find(6)
  user1 = User.create(username: 'riepenhausen', email: 'riepenhausen@makersacademy.com', password: 'abc', password_confirmation: 'abc')
  user2 = User.create(username: 'evgeny', email: 'evgeny@makersacademy.com', password: 'abc', password_confirmation: 'abc')
  Answer.create( user: user1, question: q1, user_answer: false )
  Answer.create( user: user2, question: q1, user_answer: true  )
  Answer.create( user: user1, question: q2, user_answer: false )
  Answer.create( user: user2, question: q2, user_answer: false )
  Answer.create( user: user1, question: q3, user_answer: true  )
  Answer.create( user: user2, question: q3, user_answer: true  )
  Answer.create( user: user1, question: q4, user_answer: true  )
  Answer.create( user: user2, question: q4, user_answer: true  )
  Answer.create( user: user1, question: q5, user_answer: false )
  Answer.create( user: user2, question: q5, user_answer: false )
  Answer.create( user: user1, question: q6, user_answer: true  )
  Answer.create( user: user2, question: q6, user_answer: true  )
end

Given(/^all the questions have been answered by other users$/) do
  q1, q2, q3, q4, q5, q6 = Question.find(1), Question.find(2), Question.find(3), Question.find(4), Question.find(5), Question.find(6)
  user1 = User.create(username: 'riepenhausen', email: 'riepenhausen@makersacademy.com', password: 'abc', password_confirmation: 'abc')
  user2 = User.create(username: 'evgeny', email: 'evgeny@makersacademy.com', password: 'abc', password_confirmation: 'abc')
  Answer.create( user: user1, question: q1, user_answer: false )
  Answer.create( user: user2, question: q1, user_answer: true  )
  Answer.create( user: user1, question: q2, user_answer: false )
  Answer.create( user: user2, question: q2, user_answer: true )
  Answer.create( user: user1, question: q3, user_answer: false  )
  Answer.create( user: user2, question: q3, user_answer: true  )
  Answer.create( user: user1, question: q4, user_answer: false  )
  Answer.create( user: user2, question: q4, user_answer: true  )
  Answer.create( user: user1, question: q5, user_answer: false )
  Answer.create( user: user2, question: q5, user_answer: true )
  Answer.create( user: user1, question: q6, user_answer: true  )
  Answer.create( user: user2, question: q6, user_answer: true  )
end

When(/^I am on the statistics page$/) do
  visit stats_path
end

Then(/^I should see the number of questions$/) do
  expect(page).to have_content("There are")
  expect(page).to have_content("6")
  expect(page).to have_content("questions")
end

Then(/^I should see the hardest question$/) do
  expect(page).to have_content("The hardest question is:")
  expect(page).to have_content("Is the sky blue?")
  expect(page).to have_content("Which was only answered successfully 50% of the time")
end

Then(/^I should see the easiest question$/) do
  expect(page).to have_content("The easiest question is:")
  expect(page).to have_content("Is mount everest a tall mountain?")
  expect(page).to have_content("Which was answered successfully 100% of the time")
end