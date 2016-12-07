require "rails_helper"

RSpec.describe UserFriendliesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_friendlies").to route_to("user_friendlies#index")
    end

    it "routes to #new" do
      expect(:get => "/user_friendlies/new").to route_to("user_friendlies#new")
    end

    it "routes to #show" do
      expect(:get => "/user_friendlies/1").to route_to("user_friendlies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_friendlies/1/edit").to route_to("user_friendlies#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_friendlies").to route_to("user_friendlies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_friendlies/1").to route_to("user_friendlies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_friendlies/1").to route_to("user_friendlies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_friendlies/1").to route_to("user_friendlies#destroy", :id => "1")
    end

  end
end
