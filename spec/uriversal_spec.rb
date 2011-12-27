require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Uriversal do
  describe '.strategies' do
    it 'should increase when a new strategy is made' do
      lambda{ class ExampleStrategy
        include Uriversal::Strategy
      end }.should change(Uriversal.strategies, :size).by(1)
      Uriversal.strategies.last.should == ExampleStrategy
    end
  end
end
