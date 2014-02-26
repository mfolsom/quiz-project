Feature: User signs up

  Scenario: from the sign up page
    Given I am on the sign up page
    When I fill in the the sign up form
    And press "Sign Up"
    Then I should be signed up
    And I should be on the homepage
    And I should see a welcome message

  Scenario: with an incorrect password
    Given I am on the sign up page
    When I submit the sign up form with an incorrect password
    Then I should not be signed up
    And I should be on the sign up page
    And I should see "Non-matching passwords"
