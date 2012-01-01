require 'spec_helper'

describe Uriversal::Response do
  
  describe '.status' do
    
    it 'should return false' do
      Uriversal::Response.new("","").valid?.should eq(false)
    end
    
  end
  
end