require 'spec_helper'

describe Customer do

  it "matches spefified fields" do
    FactoryGirl.create(:customer).should be_valid
  end

end
