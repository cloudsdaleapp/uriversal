module Uriversal

  class Link
    
    STATUSES = { ok: ['200'], broken: ['404','500','303'] }
    CATEGORIES = [:image,:document,:article,:video,:other]
    
    attr_accessor :raw, :protocol, :domain, :port, :path, :file_type, :query
    attr_accessor :category, :title, :description, :status
    
    def initialize(options={})
      self.raw        = options[:raw]
      self.protocol   = options[:protocol]
      self.domain     = options[:domain]
      self.port       = options[:port]
      self.file_type  = options[:file_type] ||    ''
      self.query      = options[:query]
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