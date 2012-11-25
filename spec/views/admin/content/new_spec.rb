require 'spec_helper'

describe "admin/content/new.html.erb" do
  before do
    admin = stub_model(User, :settings => {:editor => 'simple'}, :admin? => true,
                       :text_filter_name => "", :profile_label => "admin")
    blog = mock_model(Blog, :base_url => "http://myblog.net/")
    article = stub_model(Article).as_new_record
    text_filter = stub_model(TextFilter)

    article.stub(:text_filter) { text_filter }
    view.stub(:current_user) { admin }
    view.stub(:this_blog) { blog }
    
    # FIXME: Nasty. Controller should pass in @categories and @textfilters.
    Category.stub(:all) { [] }
    TextFilter.stub(:all) { [text_filter] }

    assign :article, article
  end

  it "renders with no resources or macros" do
    @fake_user = mock("admin")
    User.stub(:current_user).and_return(@fake_user)
    assign(:images, [])
    assign(:macros, [])
    assign(:resources, [])
    render
  end

  it "renders with image resources" do
    @fake_user = mock("admin")
    User.stub(:current_user).and_return(@fake_user)
    # FIXME: Nasty. Thumbnail creation should not be controlled by the view.
    img = mock_model(Resource, :filename => "foo", :create_thumbnail => nil)
    assign(:images, [img])
    assign(:macros, [])
    assign(:resources, [])
    render
  end
end
