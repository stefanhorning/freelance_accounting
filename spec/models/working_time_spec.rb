require 'spec_helper'

describe WorkingTime do

  it "matches spefified fields" do
    FactoryGirl.create(:working_time).should be_valid
  end

  it "validates presence of title" do
    FactoryGirl.build(:working_time, title: "").should_not be_valid
  end

  it "validates presence of from" do
    FactoryGirl.build(:working_time, from: "").should_not be_valid
  end

  it "validates presence of to" do
    FactoryGirl.build(:working_time, to: "").should_not be_valid
  end

  it "#from is a time object" do
    FactoryGirl.build(:working_time).from.should be_a(Time)
  end

  it "#to is a time object" do
    FactoryGirl.build(:working_time).to.should be_a(Time)
  end

  it "calculates duration currectly" do
    FactoryGirl.create(:working_time).duration.should be 10.0
  end

  it "links to given customer" do
    customer = FactoryGirl.create(:customer)
    FactoryGirl.create(:working_time, customer: customer).customer.should eq customer
  end

end
