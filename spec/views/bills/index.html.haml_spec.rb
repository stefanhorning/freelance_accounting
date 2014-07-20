require 'spec_helper'

describe "bills/index" do
  before(:each) do
    assign(:bills, [
      stub_model(Bill,
        :time_amount => 1.5,
        :price_amount => 1.5,
        :customer_id => 1
      ),
      stub_model(Bill,
        :time_amount => 1.5,
        :price_amount => 1.5,
        :customer_id => 1
      )
    ])
  end

  it "renders a list of bills" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
