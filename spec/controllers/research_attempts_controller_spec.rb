require 'spec_helper'

describe ResearchAttemptsController do

  before(:each) do
    request.env["rack.url_scheme"] = "https"
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  # This should return the minimal set of attributes required to create a valid
  # ResearchAttempt. As you add validations to ResearchAttempt, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "date" => "2013-06-13" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ResearchAttemptsController. Be sure to keep this updated too.
  def valid_session
    nil
  end

  describe "GET index" do
    it "assigns all research_attempts as @research_attempts" do
      research_attempt = ResearchAttempt.create! valid_attributes
      get :index, {}, valid_session
      assigns(:research_attempts).should eq([research_attempt])
    end
  end

  describe "GET show" do
    it "assigns the requested research_attempt as @research_attempt" do
      research_attempt = ResearchAttempt.create! valid_attributes
      get :show, {:id => research_attempt.to_param}, valid_session
      assigns(:research_attempt).should eq(research_attempt)
    end
  end

  describe "GET new" do
    it "assigns a new research_attempt as @research_attempt" do
      get :new, {}, valid_session
      assigns(:research_attempt).should be_a_new(ResearchAttempt)
    end
  end

  describe "GET edit" do
    it "assigns the requested research_attempt as @research_attempt" do
      research_attempt = ResearchAttempt.create! valid_attributes
      get :edit, {:id => research_attempt.to_param}, valid_session
      assigns(:research_attempt).should eq(research_attempt)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ResearchAttempt" do
        expect {
          post :create, {:research_attempt => valid_attributes}, valid_session
        }.to change(ResearchAttempt, :count).by(1)
      end

      it "assigns a newly created research_attempt as @research_attempt" do
        post :create, {:research_attempt => valid_attributes}, valid_session
        assigns(:research_attempt).should be_a(ResearchAttempt)
        assigns(:research_attempt).should be_persisted
      end

      it "redirects to the created research_attempt" do
        post :create, {:research_attempt => valid_attributes}, valid_session
        response.should redirect_to(ResearchAttempt.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved research_attempt as @research_attempt" do
        # Trigger the behavior that occurs when invalid params are submitted
        ResearchAttempt.any_instance.stub(:save).and_return(false)
        post :create, {:research_attempt => { "date" => "invalid value" }}, valid_session
        assigns(:research_attempt).should be_a_new(ResearchAttempt)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ResearchAttempt.any_instance.stub(:save).and_return(false)
        post :create, {:research_attempt => { "date" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested research_attempt" do
        research_attempt = ResearchAttempt.create! valid_attributes
        # Assuming there are no other research_attempts in the database, this
        # specifies that the ResearchAttempt created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ResearchAttempt.any_instance.should_receive(:update_attributes).with({ "date" => "2013-06-13" })
        put :update, {:id => research_attempt.to_param, :research_attempt => { "date" => "2013-06-13" }}, valid_session
      end

      it "assigns the requested research_attempt as @research_attempt" do
        research_attempt = ResearchAttempt.create! valid_attributes
        put :update, {:id => research_attempt.to_param, :research_attempt => valid_attributes}, valid_session
        assigns(:research_attempt).should eq(research_attempt)
      end

      it "redirects to the research_attempt" do
        research_attempt = ResearchAttempt.create! valid_attributes
        put :update, {:id => research_attempt.to_param, :research_attempt => valid_attributes}, valid_session
        response.should redirect_to(research_attempt)
      end
    end

    describe "with invalid params" do
      it "assigns the research_attempt as @research_attempt" do
        research_attempt = ResearchAttempt.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ResearchAttempt.any_instance.stub(:save).and_return(false)
        put :update, {:id => research_attempt.to_param, :research_attempt => { "date" => "invalid value" }}, valid_session
        assigns(:research_attempt).should eq(research_attempt)
      end

      it "re-renders the 'edit' template" do
        research_attempt = ResearchAttempt.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ResearchAttempt.any_instance.stub(:save).and_return(false)
        put :update, {:id => research_attempt.to_param, :research_attempt => { "date" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested research_attempt" do
      research_attempt = ResearchAttempt.create! valid_attributes
      expect {
        delete :destroy, {:id => research_attempt.to_param}, valid_session
      }.to change(ResearchAttempt, :count).by(-1)
    end

    it "redirects to the research_attempts list" do
      research_attempt = ResearchAttempt.create! valid_attributes
      delete :destroy, {:id => research_attempt.to_param}, valid_session
      response.should redirect_to(research_attempts_url)
    end
  end

end
