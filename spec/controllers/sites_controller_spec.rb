require 'spec_helper'

describe SitesController do

  before(:each) do
    request.env["rack.url_scheme"] = "https"
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  # This should return the minimal set of attributes required to create a valid
  # Site. As you add validations to Site, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      name: 'my_site',
      last_updated: Date.parse('2013-06-10')
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SitesController. Be sure to keep this updated too.
  def valid_session
    nil
  end

  describe "GET index" do
    it "assigns all sites as @sites" do
      site = Site.create! valid_attributes
      get :index, {}, valid_session
      assigns(:sites).should eq([site])
    end
  end

  describe "GET show" do
    it "assigns the requested site as @site" do
      site = Site.create! valid_attributes
      get :show, {:id => site.to_param}, valid_session
      assigns(:site).should eq(site)
    end
  end

  describe "GET new" do
    it "assigns a new site as @site" do
      get :new, {}, valid_session
      assigns(:site).should be_a_new(Site)
    end
  end

  describe "GET edit" do
    it "assigns the requested site as @site" do
      site = Site.create! valid_attributes
      get :edit, {:id => site.to_param}, valid_session
      assigns(:site).should eq(site)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Site" do
        expect {
          post :create, {:site => valid_attributes}, valid_session
        }.to change(Site, :count).by(1)
      end

      it "assigns a newly created site as @site" do
        post :create, {:site => valid_attributes}, valid_session
        assigns(:site).should be_a(Site)
        assigns(:site).should be_persisted
      end

      it "redirects to the created site" do
        post :create, {:site => valid_attributes}, valid_session
        response.should redirect_to(Site.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved site as @site" do
        # Trigger the behavior that occurs when invalid params are submitted
        Site.any_instance.stub(:save).and_return(false)
        post :create, {:site => { "name" => "invalid value" }}, valid_session
        assigns(:site).should be_a_new(Site)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Site.any_instance.stub(:save).and_return(false)
        post :create, {:site => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested site" do
        site = Site.create! valid_attributes
        # Assuming there are no other sites in the database, this
        # specifies that the Site created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Site.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => site.to_param, :site => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested site as @site" do
        site = Site.create! valid_attributes
        put :update, {:id => site.to_param, :site => valid_attributes}, valid_session
        assigns(:site).should eq(site)
      end

      it "redirects to the site" do
        site = Site.create! valid_attributes
        put :update, {:id => site.to_param, :site => valid_attributes}, valid_session
        response.should redirect_to(site)
      end
    end

    describe "with invalid params" do
      it "assigns the site as @site" do
        site = Site.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Site.any_instance.stub(:save).and_return(false)
        put :update, {:id => site.to_param, :site => { "name" => "invalid value" }}, valid_session
        assigns(:site).should eq(site)
      end

      it "re-renders the 'edit' template" do
        site = Site.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Site.any_instance.stub(:save).and_return(false)
        put :update, {:id => site.to_param, :site => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested site" do
      site = Site.create! valid_attributes
      expect {
        delete :destroy, {:id => site.to_param}, valid_session
      }.to change(Site, :count).by(-1)
    end

    it "redirects to the sites list" do
      site = Site.create! valid_attributes
      delete :destroy, {:id => site.to_param}, valid_session
      response.should redirect_to(sites_url)
    end
  end

end
