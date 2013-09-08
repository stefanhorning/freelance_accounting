require "spec_helper"

describe WorkingTimesController do
  describe "routing" do

    it "routes to #index" do
      get("/working_times").should route_to("working_times#index")
    end

    it "routes to #new" do
      get("/working_times/new").should route_to("working_times#new")
    end

    it "routes to #show" do
      get("/working_times/1").should route_to("working_times#show", :id => "1")
    end

    it "routes to #edit" do
      get("/working_times/1/edit").should route_to("working_times#edit", :id => "1")
    end

    it "routes to #create" do
      post("/working_times").should route_to("working_times#create")
    end

    it "routes to #update" do
      put("/working_times/1").should route_to("working_times#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/working_times/1").should route_to("working_times#destroy", :id => "1")
    end

  end
end
