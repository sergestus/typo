Feature: Merge Articles
  As a blog administrator
  In order to work with categories
  I want to be able to view categories

Background:
    Given the blog is set up
    And the folloing categories exist:
    | name            | position | description                    |
    | test category 1 | 1        | description of test category 1 |
    | test category 2 | 2        | description of test category 2 |

    And I am on the login page

  Scenario: A admin user view categories 
    When I am logged into as user "admin" with password "aaaaaaaa"
    Then I am on the admin panel
    When I follow "Categories"
    Then I am on the new Categories page
    Then I should see "test category 1"
    Then I should see "test category 2"
#    When I follow "test category 1"
#    Then I should see "description of test category 2"
    When I fill in the following:
     | Name           | test category 3                |
     | Description    | description of test category 3 |
    And I press "Save"
    Then I should see "test category 3"

