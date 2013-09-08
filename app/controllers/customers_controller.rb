class CustomersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction

  def index
    @customers = @customers.order_by(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 40)
    respond_to do |format|
      format.html
      format.json { render json: @customers }
    end
  end

  def show
    @working_times = @customer.working_times.paginate(:page => params[:page], :per_page => 40)
    respond_to do |format|
      format.html
      format.json { render json: @customer }
    end
  end

  def new
    respond_to do |format|
      format.html
      format.json { render json: @customer }
    end
  end

  def edit
  end

  def create
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render json: @customer, status: :created, location: @customer }
      else
        format.html { render action: "new" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  private

  def sort_column
    Customer.fields.keys.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
