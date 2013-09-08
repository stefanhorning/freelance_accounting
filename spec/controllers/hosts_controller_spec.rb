require 'spec_helper'

describe HostsController do

  before(:each) do
    request.env["rack.url_scheme"] = "https"
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  # This should return the minimal set of attributes required to create a valid
  # Host. As you add validations to Host, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { name: 'Test',
      email: 'test@test.de',
      host_id: '123',
      profile_url: 'http://test.de/123',
      comment: 'Some text',
      telephone: '3423-4143123',
      website: 'http://foobar.de',
      city: 'Berlin',
      current_user_id: "A23423"
     }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # HostsController. Be sure to keep this updated too.
  def valid_session
    nil
  end

  describe "GET index" do
    it "assigns all hosts as @hosts" do
      host = Host.create! valid_attributes
      get :index, {}, valid_session
      assigns(:hosts).should eq([host])
    end
  end

  describe "GET show" do
    it "assigns the requested host as @host" do
      host = Host.create! valid_attributes
      get :show, {:id => host.to_param}, valid_session
      assigns(:host).should eq(host)
    end
  end

  describe "GET new" do
    it "assigns a new host as @host" do
      get :new, {}, valid_session
      assigns(:host).should be_a_new(Host)
    end
  end

  describe "GET edit" do
    it "assigns the requested host as @host" do
      host = Host.create! valid_attributes
      get :edit, {:id => host.to_param}, valid_session
      assigns(:host).should eq(host)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Host" do
        expect {
          post :create, {:host => valid_attributes}, valid_session
        }.to change(Host, :count).by(1)
      end

      it "assigns a newly created host as @host" do
        post :create, {:host => valid_attributes}, valid_session
        assigns(:host).should be_a(Host)
        assigns(:host).should be_persisted
      end

      it "redirects to the created host" do
        post :create, {:host => valid_attributes}, valid_session
        response.should redirect_to(Host.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved host as @host" do
        # Trigger the behavior that occurs when invalid params are submitted
        Host.any_instance.stub(:save).and_return(false)
        post :create, {:host => { "name" => "invalid value" }}, valid_session
        assigns(:host).should be_a_new(Host)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Host.any_instance.stub(:save).and_return(false)
        post :create, {:host => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested host" do
        host = Host.create! valid_attributes
        # Assuming there are no other hosts in the database, this
        # specifies that the Host created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Host.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => host.to_param, :host => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested host as @host" do
        host = Host.create! valid_attributes
        put :update, {:id => host.to_param, :host => valid_attributes}, valid_session
        assigns(:host).should eq(host)
      end

      it "redirects to the host" do
        host = Host.create! valid_attributes
        put :update, {:id => host.to_param, :host => valid_attributes}, valid_session
        response.should redirect_to(host)
      end
    end

    describe "with invalid params" do
      it "assigns the host as @host" do
        host = Host.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Host.any_instance.stub(:save).and_return(false)
        put :update, {:id => host.to_param, :host => { "name" => "invalid value" }}, valid_session
        assigns(:host).should eq(host)
      end

      it "re-renders the 'edit' template" do
        host = Host.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Host.any_instance.stub(:save).and_return(false)
        put :update, {:id => host.to_param, :host => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested host" do
      host = Host.create! valid_attributes
      expect {
        delete :destroy, {:id => host.to_param}, valid_session
      }.to change(Host, :count).by(-1)
    end

    it "redirects to the hosts list" do
      host = Host.create! valid_attributes
      delete :destroy, {:id => host.to_param}, valid_session
      response.should redirect_to(hosts_url)
    end
  end

end
