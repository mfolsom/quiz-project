Feature: User signs in

  Scenario: from the sign in page
    Given I have already signed up
    And I am on the sign in page
    When I fill in my details
    And press "Sign In"
    Then I should be on the homepage
    And I should see a welcome message

  Scenario: with invalid password
    Given I have already signed up
    And I am on the sign in page
    When I fill in my details with an invalid password
    And press "Sign In"
    Then I should be on the sign in page
    And I should see "Invalid username or password"

  Scenario: with invalid username
    Given I have already signed up
    And I am on the sign in page
    When I fill in my details with an invalid username
    And press "Sign In"
    Then I should be on the sign in page
    And I should see "Invalid username or password"