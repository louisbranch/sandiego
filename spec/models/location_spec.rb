require 'spec_helper'

describe Location do

  before(:each) do
    @location = FactoryGirl.build(:location)
  end

  it 'is invalid without a city' do
    @location.city = nil
    @location.should have(1).error_on(:city)
  end

  it 'is invalid without a country' do
    @location.country = nil
    @location.should have(1).error_on(:country)
  end

end

