Feature: User can set departure/destination

  @javascript
  Scenario: User can can set departure point
    Given I am on main page
    When I click stop "33351" button
    And I click set departure button
    And I click stop "10452" button
    And I click set destination button
    Then departure is 공대입구
    And destination is 공동기기원
