Feature: Authentication as TA
  Scenario: Trying to delete a grade as TA
    Given there are grades in the gradebook
    And I sign in as a TA
    When I visit the homepage
    And I click "Destroy" on a post
    Then that grade should not be deleted
   
    
