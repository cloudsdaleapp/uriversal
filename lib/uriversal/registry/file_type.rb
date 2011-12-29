module Uriversal
  module Registry
    
    module FileTypes
      
      attr_accessor :file_types
      def initialize(match_strings=[],strategies=[],&block)
        super(match_strings,strategies,&block)
        @file_types = []
      end
      
      def file_type(match_strings=[],strategies=[],&block)
        ft = FileType.new(match_strings,strategies,&block)
        self.file_types.unshift ft
        ft
      end
      
    end
    
    class FileType
      
      include MatchStrings
      include Queries
      
      def initialize(match_strings=[],strategies=[],&block)
        super(match_strings,strategies,&block)
        instance_eval(&block) unless block.nil?
      end
      
    end
  end
end