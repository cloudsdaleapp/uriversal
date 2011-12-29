require 'spec_helper'

describe Uriversal::Link do
  
  before(:each) do
    # Sets a default instance
    @invalid_link = Uriversal.parse('http://google.com/not_found')
    @valid_link = Uriversal.parse('http://google.com/')
  end

  describe '.new' do
    it 'should return self as instance' do
      @valid_link.class.should == Uriversal::Link
      @invalid_link.class.should == Uriversal::Link
    end
  end
  
  describe '.load_data!' do
    it 'should return a hash' do
      @valid_link.load_data!.is_a?(Hash).should == true
      @invalid_link.load_data!.is_a?(Hash).should == true
    end
    
    it 'valid links should return a status as a string' do
      @valid_link.load_data![:status].class.should == String
    end
    
    it 'valid links should return a title as a string' do
      @valid_link.load_data![:title].class.should == String
    end
    
    it 'valid links should return a description as a string' do
      @valid_link.load_data![:title].class.should == String
    end
    
    it 'valid links should return a hash of metadata' do
      @valid_link.load_data![:metadata].class.should == Hash
    end
  end
  
  describe '.is_file?' do
    it 'should return true as file is set to .png' do
      @valid_link.file_type = 'png'
      @valid_link.is_file?.should == true
    end
    
    it 'should return false as file is not set' do
      @valid_link.file_type = ''
      @valid_link.is_file?.should == false
    end
    
  end
  
end