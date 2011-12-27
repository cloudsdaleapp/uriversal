require 'spec_helper'

describe Uriversal::Link do

  describe '.new' do
    it 'should return self as instance' do
      Uriversal::Link.new().class.should == Uriversal::Link
    end
  end

end