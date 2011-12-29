require 'spec_helper'

describe Uriversal::Registry::Domain do
  
  before(:each) do
    @domain = Uriversal::Registry::Domain.new [] do;end
    @domain_with_data = Uriversal::Registry::Domain.new [/google.com/i],[:google_search,:google_image_search] do;end
  end
  
  describe '.match_strings' do
    it 'should be an array' do
      @domain.match_strings.is_a?(Array).should == true
    end
    
    it 'should be crowded' do
      @domain_with_data.match_strings.size.should == 1
    end
  end
  
  describe '.path' do
    it 'should return Uriversal::Registry::Path' do
      @domain.path.class.should == Uriversal::Registry::Path
    end
    it 'should add to the beginning paths instance variable' do
      d = @domain.path
      @domain.paths[0].should == d
    end
  end
  
  describe '.file_type' do
    it 'should return Uriversal::Registry::FileType' do
      @domain.file_type.class.should == Uriversal::Registry::FileType
    end
    it 'should add to the beginning file_types instance variable' do
      d = @domain.file_type
      @domain.file_types[0].should == d
    end
  end
  
  describe '.query' do
    it 'should return Uriversal::Registry::Query' do
      @domain.query.class.should == Uriversal::Registry::Query
    end
    it 'should add to the beginning queries instance variable' do
      d = @domain.query
      @domain.queries[0].should == d
    end
  end
  
end