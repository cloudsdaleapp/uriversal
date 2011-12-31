module Uriversal

  require "active_support/inflector"
  require 'active_support/core_ext/string'

  require 'pry'

  autoload :Url, 'uriversal/url'
  autoload :Response, 'uriversal/response'

  autoload :Strategy, 'uriversal/strategy'
  autoload :Registry, 'uriversal/registry'
  
  def self.strategies
    Uriversal::Strategy
  end

  def self.registry
    Uriversal::Registry
  end

  def self.parse str, options={}
    url = Uriversal::Url.new(str)
    url.load_data!
  end

  
end

require 'uriversal/defaults'