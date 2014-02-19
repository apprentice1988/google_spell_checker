#encoding: utf-8
require 'net/http'
class GoogleSpellChecker
  API_BASEURI = "https://www.google.com.hk/search?"
  
  def self.check content
    params = {:q=> content, :oq=> content}
    uri = URI(API_BASEURI)
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get(uri)
    begin 
      result = res.match(/>[\s*|\w*]*<em>\w*<\/em>/)[0].to_s
      result[0]=""
      result
    rescue => e 
      puts "#{e.class}: #{e.message}"
    end
  end
end