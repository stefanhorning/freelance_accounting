require 'spec_helper'

describe "bills/edit" do
  before(:each) do
    @bill = assign(:bill, stub_model(Bill,
      :time_amount => 1.5,
      :price_amount => 1.5,
      :customer_id => 1
    ))
  end

  it "renders the edit bill form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bill_path(@bill), "post" do
      assert_select "input#bill_time_amount[name=?]", "bill[time_amount]"
      assert_select "input#bill_price_amount[name=?]", "bill[price_amount]"
      assert_select "input#bill_customer_id[name=?]", "bill[customer_id]"
    end
  end
end
