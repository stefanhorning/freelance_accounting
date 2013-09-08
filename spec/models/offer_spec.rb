require 'spec_helper'

describe Offer do
  it "matches spefified fields" do
    FactoryGirl.create(:offer).should be_valid
  end

  it "is only valid with an external offer_id" do
   FactoryGirl.build(:offer, offer_id: nil).should_not be_valid
  end

  it "should return offer_id" do
    FactoryGirl.create(:offer).offer_id.should == "A123"
  end

  it "should return latitude" do
    FactoryGirl.create(:offer).latitude.should == 41.112469
  end

  it "should return longitude" do
    FactoryGirl.create(:offer).longitude.should == -1.186523
  end

  it "should return title" do
    FactoryGirl.create(:offer).title.should == "Nice apartment"
  end

  it "should return city" do
    FactoryGirl.create(:offer).city.should == "Barcelona"
  end

  it "should return suburb" do
    FactoryGirl.create(:offer).suburb.should == "Village"
  end

  it "should return whole_apartment" do
    FactoryGirl.create(:offer).whole_apartment.should == false
  end

  it "should return instant_booking" do
    FactoryGirl.create(:offer).instant_booking.should == true
  end

  it "should return reviews" do
    FactoryGirl.create(:offer).reviews.should == 25
  end

  it "should return price" do
    FactoryGirl.create(:offer).price.should == 43.50
  end

  it "should return on_wimdu" do
    FactoryGirl.create(:offer).on_wimdu.should == true
  end

  it "should return wimdu_code" do
    FactoryGirl.create(:offer).wimdu_code.should == "4VCJ961L"
  end

  it "should return comment" do
    FactoryGirl.create(:offer).comment.should == "Test comment"
  end
end
