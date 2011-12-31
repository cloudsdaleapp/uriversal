require 'spec_helper'

describe Uriversal::Strategy do
  
  describe '#initialize' do
    it 'should have present instance variables' do
      strategy = Uriversal::Strategy.new(:test,Uriversal::Url.new("http://www.google.com/"))
      strategy.namespace.should == :test
      strategy.response == { status: '', data: {} }
    end
  end
  
  describe '.add' do
    it 'should add a strategy to @@strategies' do
      i = Uriversal::Strategy.strategies.size
      Uriversal::Strategy.add(:test) do
        on :error do;end
        on :success do;end
      end
      Uriversal::Strategy.strategies.size.should == (i + 1)
    end
    it 'should have a Proc instances in :success' do
      Uriversal::Strategy.strategies[:test][:success].class.should == Proc
    end
    it 'should have a Proc instances in :error' do
      Uriversal::Strategy.strategies[:test][:error].class.should == Proc
    end
  end
  
  describe '.status!' do
    it 'should change the status' do
      strategy = Uriversal::Strategy.new(:test,Uriversal::Url.new("http://www.google.com/"))
      strategy.response[:status].should == '0'
      strategy.send(:status!,["200","OK"])
      strategy.response[:status].should == ["200","OK"]
    end
  end
  
  describe '.perform' do
    it 'should return a Uriversal::Response' do
      strategy = Uriversal::Strategy.new(:test,Uriversal::Url.new("http://www.google.com/"))
      strategy.perform.class.should == Uriversal::Response
    end
    it 'should return a Uriversal::Response on a dead url' do
      strategy = Uriversal::Strategy.new(:test,Uriversal::Url.new("http://www.google.com/not_found"))
      strategy.perform.class.should == Uriversal::Response
    end
  end
  
end