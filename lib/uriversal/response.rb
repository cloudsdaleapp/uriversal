module Uriversal
  
  class Response
    
    attr_reader :status, :data, :url
    
    def initialize(response,url)
      raise ArgumentError "needs a hash as argument" unless response.is_a?(Hash)
      @status = response[:status]
      @data = response[:data]
      @url = url
    end
    
    def valid?
      @status.include? "200"
    end
    
    def retry!
      Uriversal.parse(url.raw)
    end
    
  end
  
end