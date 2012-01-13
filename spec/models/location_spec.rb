require 'spec_helper'

describe Location do

  before(:each) do
    @location = FactoryGirl.build(:location)
  end

  it 'is invalid without a name' do
    @location.name = nil
    @location.should have(1).error_on(:name)
  end

  it 'is invalid without a witness' do
    @location.witness = nil
    @location.should have(1).error_on(:witness)
  end

end
