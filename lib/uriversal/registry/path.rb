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
      include Strategies
      include Queries
      include FileTypes

      def initialize(match_strings=[],strategies=[],&block)
        super(match_strings,strategies,&block)
        instance_eval(&block) unless block.nil?
      end
      
      def match(link,method)
        if link.file_type and !file_types.empty?
          file_types.each{ |o| match = o.match(link,:file_type); return match if match.successful? }
        end
        if link.query and !queries.empty?
          queries.each{ |o| match = o.match(link,:query); return match if match.successful? }
        end
        super(link,method)
      end
      
    end
  end
end