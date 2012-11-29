Given /^the folloing articles exist:$/ do |articles_table|
        articles_table.hashes.each do |article|
                Article.create!(article)
        end
end

Given /^the folloing comments exist:$/ do |comments_table|
        comments_table.hashes.each do |comment|
                Comment.create!(comment)
        end
end
=begin
Given /^the folloing categories exist:$/ do |categories_table|
        categories_table.hashes.each do |category|
                Category.create!(category)
        end
end
=end
