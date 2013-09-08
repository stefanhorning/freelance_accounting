require 'spec_helper'

describe User do

  it "matches spefified fields" do
    FactoryGirl.create(:user).should be_valid
  end

  it "returns email address" do
    FactoryGirl.create(:user).email.should == "example@example.com"
  end
end
