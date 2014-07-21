class WorkingTimesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction

  def index
    @working_times = @working_times.order_by(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 40)
    respond_to do |format|
      format.html
      format.json { render json: @working_times }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @working_time }
    end
  end

  def new
    respond_to do |format|
      format.html
      format.json { render json: @working_time }
    end
  end

  def edit
  end

  def create
    respond_to do |format|
      if @working_time.save
        format.html { redirect_to @working_time, notice: 'Working time was successfully created.' }
        format.json { render json: @working_time, status: :created, location: @working_time }
      else
        format.html { render action: "new" }
        format.json { render json: @working_time.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @working_time = WorkingTime.find(params[:id])

    respond_to do |format|
      if @working_time.update_attributes(params[:working_time])
        format.html { redirect_to @working_time, notice: 'Working time was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @working_time.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @working_time.destroy

    respond_to do |format|
      format.html { redirect_to working_times_url }
      format.json { head :no_content }
    end
  end

  private

  def sort_column
    WorkingTime.fields.keys.include?(params[:sort]) ? params[:sort] : "from"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
