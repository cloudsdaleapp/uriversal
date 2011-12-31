module Uriversal
  
  class Url
    
    attr_accessor :raw, :protocol, :domain, :port, :path, :file_type, :query, :uri
    
    def initialize(url,options={})
      if url =~ /^((ftp|https?):\/\/)?([a-z\d]+([\-\.][a-z\d]+)*\.[a-z]{2,6})((:(\d{1,5}))?((\/[\w\'\"\,\-\/\:\&\=\#\%\+\(\)]*)(\.([a-z]{0,4}))?\/?(\?.*)?)?)?$/
        self.raw = url
        self.protocol  = $2     || 'http'
        self.domain    = $3     || ''
        self.port      = $7
        self.path      = $9     || ''
        self.file_type = $11    || ''
        self.query     = $12    || ''
        self.uri       = URI.parse(raw)
      else
        raise ArgumentError, "invalid url"
      end
    end
    
    # Determains if linked url is a file
    def is_file?
      !file_type.empty?
    end
    
    def load_data!
      find_match
    end
    
    private
    
    def find_match
      Uriversal::Registry.match(self)
      # if ().successful?
      #   match.match_object.strategies.each do |strategy|
      #     strategy = Uriversal::Strategy.new(strategy,self)
      #     strategy.perform
      #   end
      #   Uriversal::Response.new({ status: '0', data: {}},self)
      # end
    end
    
  end

end