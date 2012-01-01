module Uriversal
  
  class Response
    
    attr_reader :strategy, :status, :data, :url
    
    def initialize(strategy,url,args={})
      @strategy = strategy
      @url      = url
      @status   = args[:status] || ['0',""]
      @data     = args[:data] || {}
    end
    
    def valid?
      @status.include? "200"
    end
    
  end
  
end