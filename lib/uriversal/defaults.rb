Uriversal.registry.config do
  
  domain(/^.*$/i, :default) do # Matches all domains
    
    file_type(/^.*$/i, :file) # Matches all file types
    file_type(/^html$|^php$|^xhtml$/i,:default)
    
  end
  
end

Uriversal::Strategy.add(:default) do
  
  on :success do |url,request|
    
    doc = Nokogiri::HTML(request)

    # Title
    title = doc.css('title').first
    data :title, title.nil? ? url.path : title.try(:content).strip

    # Favicon
    favicon = doc.css('link[rel="shortcut icon"], link[rel="icon shortcut"], link[rel="shortcut"], link[rel="icon"]').first
    data :favicon, favicon.nil? ? '' : favicon['href'].strip
    
  end
  
  on :error do |url,error|
  end
  
end

Uriversal.strategies.add(:file) do
  
  on :success do |url,request|
  end
  
  on :error do |url,error|
  end
  
end