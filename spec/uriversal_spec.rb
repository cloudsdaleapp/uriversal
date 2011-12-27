require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Uriversal do
    
  describe '.parse' do
    
    it 'should return a Uriversal::Link object if correct url is provided' do
      Uriversal.parse("http://www.valid-url.com").class.should == Uriversal::Link
    end
    
    it 'should return nil if incorrect url is provided' do
      Uriversal.parse("htp://www.invalid-url.com").should == nil
    end
  
  end
  
end
