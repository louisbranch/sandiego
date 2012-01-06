require 'spec_helper'

describe User do
  before(:each) do
    @user = Factory(:user)
  end

  it 'returns full name' do
    @user.name.should == "Luiz Branco"
  end
end

