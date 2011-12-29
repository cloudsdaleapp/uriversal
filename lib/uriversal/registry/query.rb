module Uriversal
  module Registry
    
    module Queries
      
      attr_accessor :queries
      def initialize(match_strings=[],strategies=[],&block)
        super(match_strings,strategies,&block)
        @queries = []
      end
      
      def query(match_strings=[],strategies=[])
        q = Query.new(match_strings,strategies)
        self.queries.unshift q
        q
      end
      
    end
    
    class Query
      
      include MatchStrings
      include Strategies
      
      def initialize(match_strings=[],strategies=[],&block)
        super(match_strings,strategies,&block)
      end
      
      def match(link,method)
        super(link,method)
      end
      
    end
  end
end