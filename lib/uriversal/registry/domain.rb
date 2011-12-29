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
      
      def match(link,method)
        if !link.file_type.empty? and !file_types.empty?
          file_types.each { |o| match = o.match(link,:file_type); return match if match.successful? }
        end
        
        if !link.query.nil? and !queries.empty?
          queries.each{ |o| match = o.match(link,:query); return match if match.successful? }
        end
        
        if !link.path.empty? and !paths.empty?
          paths.each{ |o| match = o.match(link,:path); return match if match.successful? }
        end
        super(link,method)
      end
      
    end
  end
end