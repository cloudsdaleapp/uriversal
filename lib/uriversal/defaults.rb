Uriversal.registry.config do
  
  domain(/^.*$/i, :default) do # Matches all domains
    
    file_type(/^.*$/i, :file) # Matches all file types
    
  end
  
end

Uriversal::Strategy.add(:default) do
  
  on :success do |url,request|
    
    doc = Nokogiri::HTML(request)

    # Title
    data :title, doc.css('title').first.try(:content).strip

    # Favicon
    favicon = doc.css('link[rel=icon]').try(:first)
    favicon = doc.css('link[rel=shortcut]').try(:first) if favicon.nil?
    
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