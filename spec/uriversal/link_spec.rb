require 'spec_helper'

describe Uriversal::Link do
  
  describe '.new' do
    
    before do
      @link = Uriversal::Link.new('http://google.com:3000/path.png?q="hello"')
    end
    
    it 'should return self as instance' do
      @link.class.should == Uriversal::Link
    end
    
    it 'should have specific values' do
      @link.raw.should == 'http://google.com:3000/path.png?q="hello"'
      @link.protocol.should == 'http'
      @link.domain.should == 'google.com'
      @link.port.should == '3000'
      @link.path.should == '/path'
      @link.file_type.should == 'png'
      @link.query.should == '?q="hello"'
    end
    
  end
  
  describe '.load_data!' do
    
    it 'should return true if request was successful' do
      @link = Uriversal::Link.new('http://google.com/')
      @link.load_data!.should == true
    end
    
  end
  
  describe '.is_file?' do
    
    it 'should return true as file is set to .png' do
      @link = Uriversal::Link.new('http://google.com/path/to/file.jpg')
      @link.is_file?.should == true
    end
    
    it 'should return false as file is not set' do
      @link = Uriversal::Link.new('http://google.com/path/to/file')
      @link.is_file?.should == false
    end
    
  end
  
end