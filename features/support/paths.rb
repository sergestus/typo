# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    when /^the login page$/
      '/accounts/login'

    when /^the Manage articles page$/
      '/admin/content'

    when /^the new article page$/
      '/admin/content/new'

    when /^the Feedbak page/
      '/admin/feedback'

    when /^the new Categories page/
      '/admin/categories/new'

    when /^the edit page for article "([^"]*)"$/
      '/admin/content/edit/'+ Article.find_by_title($1).id.to_s

    when /^the edit page for article "([^"]*)" with id "([^"]*)" written by "([^"]*)"$/
       Article.find_by_title_and_author($1,$3).id.to_s.should == $2 
      '/admin/content/edit/'+ $2        

    when /^the edit page for article "([^"]*)" written by "([^"]*)"$/        
      '/admin/content/edit/'+ Article.find_by_title_and_author($1,$2).id

    when /admin panel/
      '/admin'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
