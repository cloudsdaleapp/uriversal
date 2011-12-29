require 'spec_helper'

describe Uriversal::Registry::Path do
  
  before(:each) do
    @path = Uriversal::Registry::Path.new [] do;end
  end
  
  describe '.match_strings' do
    it 'should be an array' do
      @path.match_strings.is_a?(Array).should == true
    end
  end
  
  describe '.file_type' do
    it 'should return Uriversal::Registry::FileType' do
      @path.file_type.class.should == Uriversal::Registry::FileType
    end
    it 'should add to the beginning file_types instance variable' do
      d = @path.file_type
      @path.file_types[0].should == d
    end
  end
  
  describe '.query' do
    it 'should return Uriversal::Registry::Query' do
      @path.query.class.should == Uriversal::Registry::Query
    end
    it 'should add to the beginning queries instance variable' do
      q = @path.query
      @path.queries[0].should == q
    end
  end
  
end