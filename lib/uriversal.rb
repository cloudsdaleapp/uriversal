module Uriversal

  require "active_support/inflector"
  require 'active_support/core_ext/string'

  require 'pry'

  autoload :Link, 'uriversal/link'



  def self.strategies
    @@strategies ||= []
  end

  autoload :Strategy, 'uriversal/strategy'

  module Strategies
    # Load some default strategies to work with
    require 'uriversal/strategies/default'
    require 'uriversal/strategies/file'
  end

  autoload :Registry, 'uriversal/registry'

  def self.registry
    Uriversal::Registry
  end

  def self.parse url, options={}
    Uriversal::Link.new url
  end

  
end

require 'uriversal/defaults'