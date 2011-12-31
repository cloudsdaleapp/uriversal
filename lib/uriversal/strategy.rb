module Uriversal
  class Strategy
    
    require 'nokogiri'
    require 'open-uri'
    
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
    
    attr_accessor :response, :namespace
    
    def initialize(_namespace,url)
      @namespace = _namespace
      @url = url
      @response = { status: '0', data: {} }
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
      end
      return Uriversal::Response.new(response,@url)
    end
    
    def data(key,d)
      @response[:data][key] = d || ""
    end
    
    private
    
    def status!(s)
      @response[:status] = s
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
