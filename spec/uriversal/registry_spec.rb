require 'spec_helper'

describe Uriversal::Registry do
  
  it 'should load Uriversal::Registry::Domain' do
    Uriversal::Registry.const_defined?(:Domain).should == true
  end
  
  it 'should load Uriversal::Registry::Path' do
    Uriversal::Registry.const_defined?(:Path).should == true
  end
  
  it 'should load Uriversal::Registry::FileType' do
    Uriversal::Registry.const_defined?(:FileType).should == true
  end
  
  describe '.config' do
    it 'should not fail with no data' do
      Uriversal::Registry.config do
      end
    end
    it 'should not fail even though very complex data is supplied' do
      Uriversal::Registry.config do
        domain /.*/i, :default do
          path /\/.*/i, :default do
            file_type /.{1,4}/i, :file do
            end
          end
        end
      end
    end
  end
  
  describe '.domain' do
    it 'should return Uriversal::Registry::Domain' do
      Uriversal::Registry.domain.class.should == Uriversal::Registry::Domain
    end
    it 'should add to the beginning domains class variable' do
      d = Uriversal::Registry.domain
      Uriversal::Registry.domains[0].should == d
    end
  end
  
end