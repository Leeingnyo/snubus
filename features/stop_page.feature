Feature: User can go stop page

  @javascript
  Scenario: User can go stop page
    Given I am on main page
    When I click stop "33351" button
    And I click stop page button
    Then I am on 공대입구 page
