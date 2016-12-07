require 'rails_helper'

RSpec.describe "UserFriendlies", type: :request do
  describe "GET /user_friendlies" do
    it "works! (now write some real specs)" do
      get user_friendlies_path
      expect(response).to have_http_status(200)
    end
  end
end
