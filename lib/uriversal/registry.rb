module Uriversal
  module Registry
    
    module MatchStrings
      attr_accessor :match_strings
      def initialize(ms=[],st=[],&block)
        super
        ms = [ms] unless ms.is_a?(Array)
        self.match_strings = ms
      end
      
      def match(link,method)
        match_strings.each do |ms|
          return Match.new(self,!(ms =~ link.try(method).to_s).nil?)
        end
        return Match.new(self)
      end
      
    end
    
    module Strategies
      attr_accessor :strategies
      def initialize(ms=[],st=[],&block)
        super
        self.strategies = st.is_a?(Array) ? st : [st]
      end
    end
    
    class Match
      attr_reader :match_object
      
      def initialize(m,s=false)
        @match_object = m
        @successful = s
      end
      
      def successful?
        @successful
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

    def self.match(url)
      @@domains.each do |domain|
        match = domain.match(url,:domain)
        return match if match.successful?
      end
    end

  end
end