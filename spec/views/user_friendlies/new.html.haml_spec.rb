require 'rails_helper'

RSpec.describe "user_friendlies/new", type: :view do
  before(:each) do
    assign(:user_friendly, UserFriendly.new(
      :name => "MyString",
      :slug => "MyString"
    ))
  end

  it "renders new user_friendly form" do
    render

    assert_select "form[action=?][method=?]", user_friendlies_path, "post" do

      assert_select "input#user_friendly_name[name=?]", "user_friendly[name]"

      assert_select "input#user_friendly_slug[name=?]", "user_friendly[slug]"
    end
  end
end
