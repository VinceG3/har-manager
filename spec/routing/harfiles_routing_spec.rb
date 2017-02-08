require "rails_helper"

RSpec.describe HarfilesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/harfiles").to route_to("harfiles#index")
    end

    it "routes to #new" do
      expect(:get => "/harfiles/new").to route_to("harfiles#new")
    end

    it "routes to #show" do
      expect(:get => "/harfiles/1").to route_to("harfiles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/harfiles/1/edit").to route_to("harfiles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/harfiles").to route_to("harfiles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/harfiles/1").to route_to("harfiles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/harfiles/1").to route_to("harfiles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/harfiles/1").to route_to("harfiles#destroy", :id => "1")
    end

  end
end
