Feature: User signs up

  Scenario: from the sign up page
    Given I am on the sign up page
    When I fill in the the sign up form
    And press "Sign Up"
    Then I should be signed up
    And I should be signed in
    And I should be on the homepage
    And I should see a welcome message

  Scenario: with an incorrect password
    Given I am on the sign up page
    When I submit the sign up form with an incorrect password
    Then I should not be signed up
    And I should be on the sign up page
    And I should see "Password confirmation doesn't match Password"

  Scenario: with a username that has been taken
    Given I have already signed up with a username
    When another user tries to sign up with that username again
    Then that user should not be signed up
    And I should be on the sign up page
    And I should see "Username has already been taken"

  Scenario: with an email that has been taken
    Given I have already signed up with an email address
    When another user tries to sign up with my email address
    Then the fraudulent user should not be signed up
    And I should be on the sign up page
    And I should see "Email has already been taken"

  Scenario: without an email
    Given I am on the sign up page
    When I submit the sign up form without an email address
    Then I should not be signed up
    And I should be on the sign up page
    And I should see "Email can't be blank"

  Scenario: without a username
    Given I am on the sign up page
    When I submit the sign up form without a username
    Then I shouldn't exist
    And I should be on the sign up page
    And I should see "Username can't be blank"


