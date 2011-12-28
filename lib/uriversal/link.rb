module Uriversal

  class Link
    
    CATEGORIES = [:image,:document,:article,:video,:other]
    filetypes = Hash.new{ { category: :other } }
    filetypes[:png]   = { category: :image }
    filetypes[:svg]   = { category: :image }
    filetypes[:jpg]   = { category: :image }
    filetypes[:jpeg]  = { category: :image }
    filetypes[:gif]   = { category: :image }
    FILETYPES = filetypes
    
    attr_accessor :raw, :protocol, :domain, :port, :path, :file_type, :query, :category, :title, :description
    
    def initialize(options={})
      self.raw        = options[:raw]
      self.protocol   = options[:protocol]
      self.domain     = options[:domain]
      self.port       = options[:port]
      self.file_type  = options[:file_type] ||    ''
      self.query      = options[:query]
      
      # Sets category from file type
      self.category = FILETYPES[file_type.to_sym][:category]
    end
    
    def is_file?
      !file_type.empty?
    end
    
    def refresh_info!
      true
    end
    
  end

end