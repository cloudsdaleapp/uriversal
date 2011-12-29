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
    require 'uriversal/strategies/default'
  end
  

  
  autoload :Registry, 'uriversal/registry'
  
  def self.registry
    Uriversal::Registry
  end
  
  def self.parse(url,options={})
    if url =~ /^((ftp|https?):\/\/)?([a-z\d]+([\-\.][a-z\d]+)*\.[a-z]{2,6})((:(\d{1,5}))?((\/[\w\'\"\,\-\/\:\&\=\#\%\+\(\)]*)(\.([a-z]{0,4}))?(\?.*)?)?)?$/
      raw_url   = $0
      protocol  = $2
      domain    = $3
      port      = $7
      file_type = $11
      query     = $12
      Uriversal::Link.new raw_url: raw_url, protocol: protocol, domain: domain, port: port, file_type: file_type, query: query
    else
      nil
    end
  end
  
  
end

require 'uriversal/defaults'