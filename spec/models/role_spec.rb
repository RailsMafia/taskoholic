require 'spec_helper'

describe Role do
  it "has a valid factory" do
    FactoryGirl.build(:role).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:notvalid_role).should_not be_valid
  end
end
