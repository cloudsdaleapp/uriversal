module Uriversal

  class Link
    
    STATUSES = { ok: ['200'], broken: ['404','500','303'] }
    CATEGORIES = [:image,:document,:article,:video,:other]
    
    attr_accessor :raw, :protocol, :domain, :port, :path, :file_type, :query
    attr_accessor :category, :title, :description, :status
    
    def initialize(url,options={})
      if url =~ /^((ftp|https?):\/\/)?([a-z\d]+([\-\.][a-z\d]+)*\.[a-z]{2,6})((:(\d{1,5}))?((\/[\w\'\"\,\-\/\:\&\=\#\%\+\(\)]*)(\.([a-z]{0,4}))?(\?.*)?)?)?$/
        self.raw       = $0
        self.protocol  = $2     || 'http'
        self.domain    = $3     || ''
        self.port      = $7
        self.path      = $9     || ''
        self.file_type = $11    || ''
        self.query     = $12    || ''
      else
        raise ArgumentError, "invalid url"
      end
    end
    
    # Determains if linked url is a file
    def is_file?
      !file_type.empty?
    end
    
    def load_data!
      { status: '404', title: '', description: '', metadata: {} }
    end
    
  end

end