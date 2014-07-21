class BillsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource


  def index
    @bills = @bills.paginate(:page => params[:bill_page], :per_page => 6)
    respond_to do |format|
      format.html
      format.json { render json: @bills }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @bill }
    end
  end

  def new
    respond_to do |format|
      format.html
      format.json { render json: @bill }
    end
  end

  def edit
  end

  def create
    respond_to do |format|
      if @bill.save
        format.html { redirect_to @bill, notice: 'Bill was successfully created.' }
        format.json { render json: @bill, status: :created, location: @bill }
      else
        format.html { render action: "new" }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @bill = Bill.find(params[:id])

    respond_to do |format|
      if @bill.update_attributes(params[:bill])
        format.html { redirect_to @bill, notice: 'Bill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bill.destroy

    respond_to do |format|
      format.html { redirect_to bills_url }
      format.json { head :no_content }
    end
  end
end
