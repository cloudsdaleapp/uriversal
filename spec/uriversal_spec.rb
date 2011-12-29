require 'spec_helper'

describe Uriversal do

  describe '.parse' do

    it 'should return a Uriversal::Link object if correct url is provided' do
      Uriversal.parse("http://www.valid-url.com").class.should == Uriversal::Link
    end

    it 'should return nil if incorrect url is provided' do
      Uriversal.parse("htp://www.invalid-url.com").should == nil
    end

  end

  describe '.registry' do
    
    it 'should return the Uriversal::Registry module' do
      Uriversal.registry.should == Uriversal::Registry
    end
    
  end
  
end

describe 'Default Settings' do
  describe 'Registry' do
    describe 'Domains' do      
      it 'last domain in registry should be matching all domain names' do
        Uriversal.registry.domains.last.match_strings.should == [/.*/i]
      end
      it 'last domain in registry should return default strategy' do
        Uriversal.registry.domains.last.strategies.should == [:default]
      end
      it 'last domain in registry should be matching file types' do
        Uriversal.registry.domains.last.file_types.length.should >= 1
      end
      it 'last domain in registry should be matching all file types' do
        Uriversal.registry.domains.last.file_types.each do |ft|
          ft.match_strings.should  == [/.*/i]
        end
      end
      it 'last domain in registry should be returning file strategy if files are specified' do
        Uriversal.registry.domains.last.file_types.each do |ft|
          ft.strategies.should  == [:file]
        end
      end
    end
  end
  
  describe 'Strategies' do
    it 'should be 2 or more strategies available' do
      Uriversal.strategies.length.should >= 1
    end
    it 'should be a default strategy' do
      Uriversal.strategies.include?(Uriversal::Strategies::Default).should == true
    end
  end
end
