require 'spec_helper'

describe CityHostAccumulationsController do

  before(:each) do
    request.env["rack.url_scheme"] = "https"
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  # This should return the minimal set of attributes required to create a valid
  # CityHostAccumulation. As you add validations to CityHostAccumulation, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "city_name" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CityHostAccumulationsController. Be sure to keep this updated too.
  def valid_session
    nil
  end

  describe "GET index" do
    it "assigns all city_host_accumulations as @city_host_accumulations" do
      city_host_accumulation = CityHostAccumulation.create! valid_attributes
      get :index, {}, valid_session
      assigns(:city_host_accumulations).should eq([city_host_accumulation])
    end
  end

  describe "GET show" do
    it "assigns the requested city_host_accumulation as @city_host_accumulation" do
      city_host_accumulation = CityHostAccumulation.create! valid_attributes
      get :show, {:id => city_host_accumulation.to_param}, valid_session
      assigns(:city_host_accumulation).should eq(city_host_accumulation)
    end
  end

  describe "GET new" do
    it "assigns a new city_host_accumulation as @city_host_accumulation" do
      get :new, {}, valid_session
      assigns(:city_host_accumulation).should be_a_new(CityHostAccumulation)
    end
  end

  describe "GET edit" do
    it "assigns the requested city_host_accumulation as @city_host_accumulation" do
      city_host_accumulation = CityHostAccumulation.create! valid_attributes
      get :edit, {:id => city_host_accumulation.to_param}, valid_session
      assigns(:city_host_accumulation).should eq(city_host_accumulation)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CityHostAccumulation" do
        expect {
          post :create, {:city_host_accumulation => valid_attributes}, valid_session
        }.to change(CityHostAccumulation, :count).by(1)
      end

      it "assigns a newly created city_host_accumulation as @city_host_accumulation" do
        post :create, {:city_host_accumulation => valid_attributes}, valid_session
        assigns(:city_host_accumulation).should be_a(CityHostAccumulation)
        assigns(:city_host_accumulation).should be_persisted
      end

      it "redirects to the created city_host_accumulation" do
        post :create, {:city_host_accumulation => valid_attributes}, valid_session
        response.should redirect_to(CityHostAccumulation.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved city_host_accumulation as @city_host_accumulation" do
        # Trigger the behavior that occurs when invalid params are submitted
        CityHostAccumulation.any_instance.stub(:save).and_return(false)
        post :create, {:city_host_accumulation => { "city_name" => "invalid value" }}, valid_session
        assigns(:city_host_accumulation).should be_a_new(CityHostAccumulation)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        CityHostAccumulation.any_instance.stub(:save).and_return(false)
        post :create, {:city_host_accumulation => { "city_name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested city_host_accumulation" do
        city_host_accumulation = CityHostAccumulation.create! valid_attributes
        # Assuming there are no other city_host_accumulations in the database, this
        # specifies that the CityHostAccumulation created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        CityHostAccumulation.any_instance.should_receive(:update_attributes).with({ "city_name" => "MyString" })
        put :update, {:id => city_host_accumulation.to_param, :city_host_accumulation => { "city_name" => "MyString" }}, valid_session
      end

      it "assigns the requested city_host_accumulation as @city_host_accumulation" do
        city_host_accumulation = CityHostAccumulation.create! valid_attributes
        put :update, {:id => city_host_accumulation.to_param, :city_host_accumulation => valid_attributes}, valid_session
        assigns(:city_host_accumulation).should eq(city_host_accumulation)
      end

      it "redirects to the city_host_accumulation" do
        city_host_accumulation = CityHostAccumulation.create! valid_attributes
        put :update, {:id => city_host_accumulation.to_param, :city_host_accumulation => valid_attributes}, valid_session
        response.should redirect_to(city_host_accumulation)
      end
    end

    describe "with invalid params" do
      it "assigns the city_host_accumulation as @city_host_accumulation" do
        city_host_accumulation = CityHostAccumulation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CityHostAccumulation.any_instance.stub(:save).and_return(false)
        put :update, {:id => city_host_accumulation.to_param, :city_host_accumulation => { "city_name" => "invalid value" }}, valid_session
        assigns(:city_host_accumulation).should eq(city_host_accumulation)
      end

      it "re-renders the 'edit' template" do
        city_host_accumulation = CityHostAccumulation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CityHostAccumulation.any_instance.stub(:save).and_return(false)
        put :update, {:id => city_host_accumulation.to_param, :city_host_accumulation => { "city_name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested city_host_accumulation" do
      city_host_accumulation = CityHostAccumulation.create! valid_attributes
      expect {
        delete :destroy, {:id => city_host_accumulation.to_param}, valid_session
      }.to change(CityHostAccumulation, :count).by(-1)
    end

    it "redirects to the city_host_accumulations list" do
      city_host_accumulation = CityHostAccumulation.create! valid_attributes
      delete :destroy, {:id => city_host_accumulation.to_param}, valid_session
      response.should redirect_to(city_host_accumulations_url)
    end
  end

end
