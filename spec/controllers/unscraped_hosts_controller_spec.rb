require 'spec_helper'

describe UnscrapedHostsController do

  before(:each) do
    request.env["rack.url_scheme"] = "https"
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
