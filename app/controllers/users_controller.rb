class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction

  def index
    @users = @users.order_by(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 40)
    respond_to do |format|
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def new
    respond_to do |format|
      format.html
    end
  end

  def edit
  end

  def create
    if @user.save
      respond_to do |format|
        format.html { redirect_to :action => :index }
      end
    else
      respond_to do |format|
        format.html { render :action => :new, :status => :unprocessable_entity }
      end
    end
  end

  def update
    if params[:user][:role] and params[:user][:role] != @user.role
      # only update the users role if the permission is given
      authorize! :assign_roles, @user
    end
    if params[:user][:password].blank?
      [:password,:password_confirmation].collect{|p| params[:user].delete(p) }
    end
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = "User has been updated"
        format.html { render :action => :edit }
      else
        format.html { render :action => :edit, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end

  private

  def sort_column
    User.fields.keys.include?(params[:sort]) ? params[:sort] : "email"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
