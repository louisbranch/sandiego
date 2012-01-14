require 'spec_helper'

describe Mission do

  before(:each) do
    @rank = Factory.stub(:rank)
    @mission = Factory.stub(:mission, :rank => @rank)
  end

end
