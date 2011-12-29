require 'spec_helper'

describe Uriversal::Registry::FileType do
  
  before(:each) do
    @file_type = Uriversal::Registry::FileType.new [] do;end
  end
  
  describe '.match_strings' do
    it 'should be an array' do
      @file_type.match_strings.is_a?(Array).should == true
    end
  end
  
  describe '.query' do
    it 'should return Uriversal::Registry::Query' do
      @file_type.query.class.should == Uriversal::Registry::Query
    end
    it 'should add to the beginning queries instance variable' do
      q = @file_type.query
      @file_type.queries[0].should == q
    end
  end
end