require 'spec_helper'

describe Uriversal::Link do

  describe '.new' do
    it 'should return self as instance' do
      Uriversal::Link.new().class.should == Uriversal::Link
    end
  end
  
  describe '.is_file?' do
    it 'should return true if file type is not nil' do
      Uriversal::Link.new(protocol: 'http', domain: 'cloudsdale.com', path: '/some/image/path', file_type: 'png').is_file?.should == true
    end
  end
  
  describe '.refresh_info!' do
    it 'should return true if request is valid' do
      Uriversal::Link.new(protocol: 'http', domain: 'cloudsdale.com', path: '/some/image/path').refresh_info!.should == true
    end
  end
  
  describe 'initial category' do
    it "should have category 'image' if file type 'png', 'svg', 'jpg', 'jpeg', 'gif'" do
      Uriversal::Link.new(protocol: 'http', domain: 'cloudsdale.com', path: '/some/image/path', file_type: 'png').category.should == :image
      Uriversal::Link.new(protocol: 'http', domain: 'cloudsdale.com', path: '/some/image/path', file_type: 'jpg').category.should == :image
      Uriversal::Link.new(protocol: 'http', domain: 'cloudsdale.com', path: '/some/image/path', file_type: 'jpeg').category.should == :image
      Uriversal::Link.new(protocol: 'http', domain: 'cloudsdale.com', path: '/some/image/path', file_type: 'svg').category.should == :image
      Uriversal::Link.new(protocol: 'http', domain: 'cloudsdale.com', path: '/some/image/path', file_type: 'gif').category.should == :image
    end
  end

end