Feature: Add Question

Scenario: creating a new question
Given I am on the new question page
And I fill in the form
When I press "Create"
Then the question should be in the database
And I should see "Question added!"
