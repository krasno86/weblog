require 'rails_helper'

RSpec.describe "user_friendlies/show", type: :view do
  before(:each) do
    @user_friendly = assign(:user_friendly, UserFriendly.create!(
      :name => "Name",
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Slug/)
  end
end
