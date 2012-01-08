require 'spec_helper'

describe Trait do

  before(:each) do
    @trait = FactoryGirl.build(:trait)
  end

  it 'is invalid without a Suspect' do
    @trait.suspect = nil
    @trait.should_not be_valid
  end

  it 'is invalid without a category' do
    @trait.category = nil
    @trait.should_not be_valid
  end

  it 'is invalid without a description' do
    @trait.description = nil
    @trait.should_not be_valid
  end

  it 'creates a gender trait' do
    @trait.gender
    @trait.category.should == 'gender'
  end
end

