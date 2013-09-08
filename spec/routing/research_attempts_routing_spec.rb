require "spec_helper"

describe ResearchAttemptsController do
  describe "routing" do

    it "routes to #index" do
      get("/research_attempts").should route_to("research_attempts#index")
    end

    it "routes to #new" do
      get("/research_attempts/new").should route_to("research_attempts#new")
    end

    it "routes to #show" do
      get("/research_attempts/1").should route_to("research_attempts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/research_attempts/1/edit").should route_to("research_attempts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/research_attempts").should route_to("research_attempts#create")
    end

    it "routes to #update" do
      put("/research_attempts/1").should route_to("research_attempts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/research_attempts/1").should route_to("research_attempts#destroy", :id => "1")
    end

  end
end
