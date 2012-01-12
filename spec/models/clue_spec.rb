require 'spec_helper'

describe Clue do

  before(:each) do
    @clue = FactoryGirl.build(:clue)
  end

  it 'is invalid without a location' do
    @clue.location = nil
    @clue.should have(1).error_on(:location)
  end

  it 'is invalid without a description' do
    @clue.description = nil
    @clue.should have(1).error_on(:description)
  end

  it 'belongs to a location' do
    @clue.should belongs_to(:location)
  end

end

