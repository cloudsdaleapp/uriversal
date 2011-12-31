require 'spec_helper'

describe Uriversal::Url do
  
  describe '.new' do
    
    before do
      @url = Uriversal::Url.new('http://google.com:3000/path.png?q=hello')
    end
    
    it 'should return self as instance' do
      @url.class.should == Uriversal::Url
    end
    
    it 'should have specific values' do
      @url.raw.should == 'http://google.com:3000/path.png?q=hello'
      @url.protocol.should == 'http'
      @url.domain.should == 'google.com'
      @url.port.should == 3000
      @url.path.should == '/path'
      @url.file_type.should == 'png'
      @url.query.should == 'q=hello'
    end
    
  end
  
  describe '.load_data!' do
    
    it 'should return Uriversal::Response if request was successful' do
      Uriversal::Url.new('http://google.com/').load_data!.class.should == Uriversal::Response
    end
    
  end
  
  describe '.is_file?' do
    
    it 'should return true as file is set to .png' do
      @url = Uriversal::Url.new('http://google.com/path/to/file.jpg')
      @url.is_file?.should == true
    end
    
    it 'should return false as file is not set' do
      @url = Uriversal::Url.new('http://google.com/path/to/file')
      @url.is_file?.should == false
    end
    
  end
  
end