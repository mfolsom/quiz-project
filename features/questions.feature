Feature: Questions

Scenario: cannot see question
  Given I am not logged in
  When I am on the homepage
  Then I should not see any questions

@random
Scenario: seeing a question
  Given I have already signed up
  Then I should see the first question

Scenario: seeing a second question
  Given I have already signed up
  And I complete a question
  When I click "Next"
  Then I should be on the homepage

  Scenario: seeing a new question
  Given I have already signed up
  And I complete a question
  When I click "Next"
  Then I should not see the question I just answered
