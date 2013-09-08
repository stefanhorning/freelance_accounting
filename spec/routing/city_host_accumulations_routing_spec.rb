require "spec_helper"

describe CityHostAccumulationsController do
  describe "routing" do

    it "routes to #index" do
      get("/city_host_accumulations").should route_to("city_host_accumulations#index")
    end

    it "routes to #new" do
      get("/city_host_accumulations/new").should route_to("city_host_accumulations#new")
    end

    it "routes to #show" do
      get("/city_host_accumulations/1").should route_to("city_host_accumulations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/city_host_accumulations/1/edit").should route_to("city_host_accumulations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/city_host_accumulations").should route_to("city_host_accumulations#create")
    end

    it "routes to #update" do
      put("/city_host_accumulations/1").should route_to("city_host_accumulations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/city_host_accumulations/1").should route_to("city_host_accumulations#destroy", :id => "1")
    end

  end
end
