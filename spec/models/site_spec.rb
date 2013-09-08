require 'spec_helper'

describe Site do

  it "matches spefified fields" do
    FactoryGirl.create(:site).should be_valid
  end

  it "should only be valid with a name" do
    FactoryGirl.build(:site, name: nil).should_not be_valid
  end

  it "should return name" do
    FactoryGirl.create(:site).name.should == "accomodation_site"
  end

  it "should return search_base_url" do
    FactoryGirl.create(:site).search_base_url.should == "http://xyz.de/search"
  end

  it "should return last_updated" do
    FactoryGirl.create(:site).last_updated.should == Date.parse('2013-06-10')
  end
end
