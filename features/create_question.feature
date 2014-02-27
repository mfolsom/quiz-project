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

  Scenario: not seeing a created question
    Given I have already signed up
    And there are no questions in the database
    And I create a question
    And I press "Create"
    When I am on the homepage
    Then I should not see "Is a bushel a unit of measure?"
    And I should see "No questions yet, sorry."