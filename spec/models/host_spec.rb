require "spec_helper"

describe Host do
  it "matches spefified fields" do
    FactoryGirl.create(:host).should be_valid
  end

  it "should return full name" do
    FactoryGirl.create(:host, name: "Heinz Meier").name.should == "Heinz Meier"
  end

  it "should return right value for email" do
    FactoryGirl.create(:host).email.should == "test@test.de"
  end

  it "should return right value for host_id" do
    FactoryGirl.create(:host).host_id.should == "A1234567"
  end

  it "should return right value for comment" do
    FactoryGirl.create(:host).comment.should == "A nice little comment"
  end

  it "should return right amount of reviews" do
    FactoryGirl.create(:host).reviews.should == 15
  end

  it "should return right value for superhost" do
    FactoryGirl.create(:host).superhost.should == true
  end

  it "should have unique email address" do
    FactoryGirl.create(:host, email: "name@host.com")
    FactoryGirl.build(:host, email: "name@host.com").should_not be_valid
  end

  it "should set on_wimdu to false by default" do
    FactoryGirl.create(:host).on_wimdu.should == false
  end

  it "returns true if set on_wimdu is set" do
    FactoryGirl.create(:host, on_wimdu: true).on_wimdu.should == true
  end
end
