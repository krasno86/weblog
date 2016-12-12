require 'rails_helper'

RSpec.describe ParserController, type: :controller do

  describe "GET #yandex" do
    it "returns http success" do
      get :yandex
      expect(response).to have_http_status(:success)
    end
  end

end
