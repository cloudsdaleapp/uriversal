module Uriversal
  module Registry
    
    class Domain
      
      include MatchStrings
      include Strategies
      include Queries
      include FileTypes
      include Paths
      
      def initialize(match_strings=[],strategies=[],&block)
        super(match_strings,strategies,&block)
        instance_eval(&block) unless block.nil?
      end
    
    end
  end
end