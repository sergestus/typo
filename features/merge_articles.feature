Feature: Merge Articles
  As a blog administrator
  In order to merge articles
  I want to be able to merge articles

Background:
    Given the blog is set up
    And the folloing articles exist:
    | title        | author | body   | created_at          | published |
    | test article | admin  | text 1 | 2012-11-20 17:58:23 | true      |
    | test article | user   | text 2 | 2012-11-20 17:58:22 | true      |
    And the folloing comments exist:
    | article_id  | title          | author | body                      | created_at          |
    |      3      | test comment 1 | admin  | comment on test article 3 | 2012-11-20 17:58:23 |
    |      4      | test comment 2 | user   | comment on test article 4 | 2012-11-20 17:58:22 |
    And I am on the login page


  Scenario: A non-admin cannot merge articles
    When I am logged into as user "user" with password "uuuuuuuu"
    Then I am on the admin panel
    When I follow "All Articles"
    Then I am on the Manage articles page
    And I should see "test article"
    Given I am on the the edit page for article "test article" with id "4" written by "user"
    Then I should not see "Merge Articles"

  Scenario: A admin user merge articles 
    When I am logged into as user "admin" with password "aaaaaaaa"
    Then I am on the admin panel
    When I follow "Comments"
    Then I am on the Feedbak page
    And I should see "comment on test article 3"
    And I should see "comment on test article 4"
    When I follow "All Articles"
    Then I am on the Manage articles page
    And I should see "test article"
    Given I am on the the edit page for article "test article" with id "3" written by "admin"
    And I should see "Merge Articles"
    When I fill in "merge_with" with "4"
    And I press "Merge"
    Then I am on the Manage articles page
    And I should see "test article"
    Given I am on the the edit page for article "test article" with id "5" written by "admin"
    And I should see text from article "3" and "4"
    And I there are should not be comments to article "3" and "4"



