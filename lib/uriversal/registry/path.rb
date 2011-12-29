module Uriversal
  module Registry
    
    module Paths
      
      attr_accessor :paths
      def initialize(match_strings=[],strategies=[],&block)
        super(match_strings,strategies,&block)
        @paths = []
      end
      
      def path(match_strings=[],strategies=[],&block)
        p = Path.new(match_strings,strategies,&block)
        self.paths.unshift p
        p
      end
      
    end
    
    class Path
      
      include MatchStrings
      include Queries
      include FileTypes

      def initialize(match_strings=[],strategies=[],&block)
        super(match_strings,strategies,&block)
        instance_eval(&block) unless block.nil?
      end
      
    end
  end
end