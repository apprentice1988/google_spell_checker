#encoding: utf-8
require 'net/http'
class GoogleSpellChecker
  API_BASEURI = "https://www.google.com.hk/search?"
  SPELL_EXP = Regexp.new(/(\s|\w)*<em>(\w)*<\/em\>(\s|\w)*/)
  
  def self.check content
    params = {:q=> content, :oq=> content}
    uri = URI(API_BASEURI)
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get(uri)
    matches = res.to_enum(:scan,SPELL_EXP).map{Regexp.last_match}
    matches[0,(matches.count/2)].inject(""){|result,match|result + match.to_s}
  end
end