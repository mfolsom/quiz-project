Feature: Add Question

  Scenario: creating a new question
    Given I am on the new question page
    And I fill in the form
    When I press "Create"
    Then the question should be in the database
    And I should see "Question added!"

  Scenario: creating a new question as a user
    Given I have already signed up
    And I am signed in
    And I should see "Welcome ecomba!""
    When I create a question
    And I press "Create"
    Then I should be the author of that question
