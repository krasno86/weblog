require 'rails_helper'

RSpec.describe "user_friendlies/index", type: :view do
  before(:each) do
    assign(:user_friendlies, [
      UserFriendly.create!(
        :name => "Name",
        :slug => "Slug"
      ),
      UserFriendly.create!(
        :name => "Name",
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of user_friendlies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
