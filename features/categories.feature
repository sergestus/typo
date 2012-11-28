Feature: Merge Articles
  As a blog administrator
  In order to work with categories
  I want to be able to view categories

Background:
    Given the blog is set up
#    And the folloing articles exist:
#    | title        | author | body   | created_at          | published |
#    | test article | admin  | text 3 | 2012-11-20 17:58:23 | true      |
#    | test article | user   | text 4 | 2012-11-20 17:58:22 | true      |
#    And the folloing comments exist:
#    | article_id  | title          | author | body                      | created_at          |
#    |      3      | test comment 3 | admin  | comment on test article 3 | 2012-11-20 17:58:23 |
#    |      4      | test comment 4 | user   | comment on test article 4 | 2012-11-20 17:58:22 |
#    And I am on the login page

  Scenario: A admin user view categories 
    When I am logged into as user "admin" with password "aaaaaaaa"
    Then I am on the admin panel
    When I follow "Categories"
    Then I am on the new Categories page

