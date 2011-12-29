module Uriversal
  module Registry
    
    module MatchStrings
      attr_accessor :match_strings
      def initialize(ms=[],st=[],&block)
        super
        ms = [ms] unless ms.is_a?(Array)
        self.match_strings = ms
      end
    end
    
    module Strategies
      attr_accessor :strategies
      def initialize(ms=[],st=[],&block)
        super
        st = [st] unless st.is_a?(Array)
        self.strategies = st
      end
    end
    
    require 'uriversal/registry/query'
    require 'uriversal/registry/file_type'
    require 'uriversal/registry/path'
    require 'uriversal/registry/domain'
    
    @@domains = []
    
    def self.domains
      @@domains
    end
    
    def self.domain(match_strings=[],strategies=[],&block)
      d = Domain.new(match_strings,strategies,&block)
      @@domains.unshift d
      d
    end
    
    def self.config(args={},&block)
      module_eval(&block)
    end

  end
end