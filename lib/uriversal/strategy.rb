module Uriversal
  class Strategy
    
    #STATUSES = { ok: ['200'], broken: ['404','500','303'] }
    EVENTS = [:success,:error]
    
    @@strategies = {}
    
    def self.strategies
      @@strategies
    end
    
    @@namespace = :""
    
    def self.add(strategy_name,&block)
      @@namespace = strategy_name.to_sym
      @@strategies[@@namespace] = { success: Proc.new {}, error: Proc.new {} }
      class_eval(&block) if block_given?
      @@namespace = :""
    end
    
    attr_reader :response, :namespace, :match, :url
    
    def initialize(_namespace,url)
      @namespace = _namespace
      @url = url
      @match = url.raw
      @response = Uriversal::Response.new(self,@url)
    end
    
    def perform(args={})
      begin
        request = open(@url.uri.to_s)
        status!(request.status)
        run!(:success,@url,request) unless args[:skip_request]
      rescue OpenURI::HTTPError => error
        status!(error.message.split(" ",2))
        run!(:error,@url,error) unless args[:skip_request]
      rescue SocketError => error
        status!(["404","Not Found"])
        run!(:error,@url,error) unless args[:skip_request]
      rescue Errno::ENOENT => error
        status!(["400","Bad Request"])
        run!(:error,@url,error) unless args[:skip_request]
      end
      return @response
    end
    
    def data(key,val)
      @response.instance_variable_get(:@data).store(key,val)
    end
    
    private
    
    def match=(string)
    end
    
    def status!(s)
      @response.instance_variable_set(:@status, s)
    end
    
    def run!(event,url,obj)
      instance_exec(url,obj,&@@strategies[namespace][event])
    end    
    
    def self.on(event,&block)
      raise ArgumentError "invalid event - only :success and :error allowed" unless EVENTS.include?(event)
      @@strategies[@@namespace][event] = block
    end
    
  end
end
