require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe WorkingTimesController do

  # This should return the minimal set of attributes required to create a valid
  # WorkingTime. As you add validations to WorkingTime, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      "title" => "My Title",
      "from"  => "27.07.2014 19:02:45",
      "to"    => "27.07.2014 19:12:45",
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WorkingTimesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all working_times as @working_times" do
      working_time = WorkingTime.create! valid_attributes
      get :index, {}, valid_session
      assigns(:working_times).should eq([working_time])
    end
  end

  describe "GET show" do
    it "assigns the requested working_time as @working_time" do
      working_time = WorkingTime.create! valid_attributes
      get :show, {:id => working_time.to_param}, valid_session
      assigns(:working_time).should eq(working_time)
    end
  end

  describe "GET new" do
    it "assigns a new working_time as @working_time" do
      get :new, {}, valid_session
      assigns(:working_time).should be_a_new(WorkingTime)
    end
  end

  describe "GET edit" do
    it "assigns the requested working_time as @working_time" do
      working_time = WorkingTime.create! valid_attributes
      get :edit, {:id => working_time.to_param}, valid_session
      assigns(:working_time).should eq(working_time)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new WorkingTime" do
        expect {
          post :create, {:working_time => valid_attributes}, valid_session
        }.to change(WorkingTime, :count).by(1)
      end

      it "assigns a newly created working_time as @working_time" do
        post :create, {:working_time => valid_attributes}, valid_session
        assigns(:working_time).should be_a(WorkingTime)
        assigns(:working_time).should be_persisted
      end

      it "redirects to the created working_time" do
        post :create, {:working_time => valid_attributes}, valid_session
        response.should redirect_to(WorkingTime.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved working_time as @working_time" do
        # Trigger the behavior that occurs when invalid params are submitted
        WorkingTime.any_instance.stub(:save).and_return(false)
        post :create, {:working_time => { "title" => "invalid value" }}, valid_session
        assigns(:working_time).should be_a_new(WorkingTime)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        WorkingTime.any_instance.stub(:save).and_return(false)
        post :create, {:working_time => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested working_time" do
        working_time = WorkingTime.create! valid_attributes
        # Assuming there are no other working_times in the database, this
        # specifies that the WorkingTime created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        WorkingTime.any_instance.should_receive(:update_attributes).with({ "title" => "MyString" })
        put :update, {:id => working_time.to_param, :working_time => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested working_time as @working_time" do
        working_time = WorkingTime.create! valid_attributes
        put :update, {:id => working_time.to_param, :working_time => valid_attributes}, valid_session
        assigns(:working_time).should eq(working_time)
      end

      it "redirects to the working_time" do
        working_time = WorkingTime.create! valid_attributes
        put :update, {:id => working_time.to_param, :working_time => valid_attributes}, valid_session
        response.should redirect_to(working_time)
      end
    end

    describe "with invalid params" do
      it "assigns the working_time as @working_time" do
        working_time = WorkingTime.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        WorkingTime.any_instance.stub(:save).and_return(false)
        put :update, {:id => working_time.to_param, :working_time => { "title" => "invalid value" }}, valid_session
        assigns(:working_time).should eq(working_time)
      end

      it "re-renders the 'edit' template" do
        working_time = WorkingTime.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        WorkingTime.any_instance.stub(:save).and_return(false)
        put :update, {:id => working_time.to_param, :working_time => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested working_time" do
      working_time = WorkingTime.create! valid_attributes
      expect {
        delete :destroy, {:id => working_time.to_param}, valid_session
      }.to change(WorkingTime, :count).by(-1)
    end

    it "redirects to the working_times list" do
      working_time = WorkingTime.create! valid_attributes
      delete :destroy, {:id => working_time.to_param}, valid_session
      response.should redirect_to(working_times_url)
    end
  end

end
