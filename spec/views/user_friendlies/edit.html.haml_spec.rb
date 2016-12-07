require 'rails_helper'

RSpec.describe "user_friendlies/edit", type: :view do
  before(:each) do
    @user_friendly = assign(:user_friendly, UserFriendly.create!(
      :name => "MyString",
      :slug => "MyString"
    ))
  end

  it "renders the edit user_friendly form" do
    render

    assert_select "form[action=?][method=?]", user_friendly_path(@user_friendly), "post" do

      assert_select "input#user_friendly_name[name=?]", "user_friendly[name]"

      assert_select "input#user_friendly_slug[name=?]", "user_friendly[slug]"
    end
  end
end
