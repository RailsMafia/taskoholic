require 'spec_helper'

describe Project do
  before do
    user = FactoryGirl.create(:user)
    @project = FactoryGirl.create(:project, owner: user)
  end
  
  subject { @project }
  
  it { should respond_to(:name) }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @project.name = " " }
    it { should_not be_valid }
  end
  
  describe "when owner is not present" do
    before { @project.owner = nil }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @project.name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when name is too short" do
    before { @project.name = "a" }
    it { should_not be_valid }
  end
  
  describe "when description is too long" do
    before { @project.description = "a" * 1001 }
    it { should_not be_valid }
  end
  
  describe "when description is too short" do
    before { @project.description = "a" }
    it { should_not be_valid }
  end
  
end