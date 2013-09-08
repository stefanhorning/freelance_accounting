require 'spec_helper'

describe OffersController do

  before(:each) do
    request.env["rack.url_scheme"] = "https"
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  # This should return the minimal set of attributes required to create a valid
  # Offer. As you add validations to Offer, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      offer_id: 'A123',
      url: 'http://testbnb.com/A123',
      title: 'Nice little flat',
      city: 'New York',
      suburb: 'Manhattan',
      whole_apartment: true,
      instant_booking: true,
      reviews: 10,
      price: 110.5,
      in_system: true,
      wimdu_code: 'AXC1E23',
      comment: 'Some text'
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OffersController. Be sure to keep this updated too.
  def valid_session
    nil
  end

  describe "GET index" do
    it "assigns all offers as @offers" do
      offer = Offer.create! valid_attributes
      get :index, {}, valid_session
      assigns(:offers).should eq([offer])
    end
  end

  describe "GET show" do
    it "assigns the requested offer as @offer" do
      offer = Offer.create! valid_attributes
      get :show, {:id => offer.to_param}
      assigns(:offer).should eq(offer)
    end
  end

  describe "GET new" do
    it "assigns a new offer as @offer" do
      get :new, {}
      assigns(:offer).should be_a_new(Offer)
    end
  end

  describe "GET edit" do
    it "assigns the requested offer as @offer" do
      offer = Offer.create! valid_attributes
      get :edit, {:id => offer.to_param}
      assigns(:offer).should eq(offer)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Offer" do
        expect {
          post :create, {:offer => valid_attributes}
        }.to change(Offer, :count).by(1)
      end

      it "assigns a newly created offer as @offer" do
        post :create, {:offer => valid_attributes}
        assigns(:offer).should be_a(Offer)
        assigns(:offer).should be_persisted
      end

      it "redirects to the created offer" do
        post :create, {:offer => valid_attributes}
        response.should redirect_to(Offer.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved offer as @offer" do
        # Trigger the behavior that occurs when invalid params are submitted
        Offer.any_instance.stub(:save).and_return(false)
        post :create, {:offer => { "url" => "invalid value" }}
        assigns(:offer).should be_a_new(Offer)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Offer.any_instance.stub(:save).and_return(false)
        post :create, {:offer => { "url" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested offer" do
        offer = Offer.create! valid_attributes
        # Assuming there are no other offers in the database, this
        # specifies that the Offer created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Offer.any_instance.should_receive(:update_attributes).with({ "url" => "MyString" })
        put :update, {:id => offer.to_param, :offer => { "url" => "MyString" }}
      end

      it "assigns the requested offer as @offer" do
        offer = Offer.create! valid_attributes
        put :update, {:id => offer.to_param, :offer => valid_attributes}
        assigns(:offer).should eq(offer)
      end

      it "redirects to the offer" do
        offer = Offer.create! valid_attributes
        put :update, {:id => offer.to_param, :offer => valid_attributes}
        response.should redirect_to(offer)
      end
    end

    describe "with invalid params" do
      it "assigns the offer as @offer" do
        offer = Offer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Offer.any_instance.stub(:save).and_return(false)
        put :update, {:id => offer.to_param, :offer => { "url" => "invalid value" }}
        assigns(:offer).should eq(offer)
      end

      it "re-renders the 'edit' template" do
        offer = Offer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Offer.any_instance.stub(:save).and_return(false)
        put :update, {:id => offer.to_param, :offer => { "url" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested offer" do
      offer = Offer.create! valid_attributes
      expect {
        delete :destroy, {:id => offer.to_param}
      }.to change(Offer, :count).by(-1)
    end

    it "redirects to the offers list" do
      offer = Offer.create! valid_attributes
      delete :destroy, {:id => offer.to_param}
      response.should redirect_to(offers_url)
    end
  end

end
