require 'spec_helper'

describe Mission do

  before(:each) do
    @rank = Factory.stub(:rank)
    @mission = Factory.stub(:mission, :rank => @rank)
  end

  it 'creates n missions for the first rank' do
    pending
  end

  it 'returns its prize' do
    #@mission.calculate_prize.should == 10
  end

end

