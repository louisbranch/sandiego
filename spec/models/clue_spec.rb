#encoding: UTF-8
require 'spec_helper'

describe Clue do

  before(:each) do
    @clue = FactoryGirl.build(:clue)
    @clue.valid?
  end

  error_message = 'não pode ficar em branco'

  it 'is invalid without a city' do
    @clue.city = nil
    @clue.should_not be_valid
    @clue.errors[:city].should include(error_message)
  end

  it 'is invalid without a description' do
    @clue.description = nil
    @clue.should_not be_valid
    @clue.errors[:description].should include(error_message)
  end

  it 'belongs to a city' do
    @clue.should belong_to(:city)
  end

end
