#encoding: utf-8
require 'net/http'
require 'google_spell_checker/config'
module GoogleSpellChecker
  def self.check content
    check_using_hk?
    params = {:q=> content, :oq=> content}
    uri = URI(@base)
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get(uri)
    matches = res.to_enum(:scan,@regex).map{Regexp.last_match}
    matches[0,(matches.count/2)].inject(""){|result,match|result + match.to_s}
  end

  private

  def self.check_using_hk?
    if GoogleSpellChecker.config.using_hk
      @base = "https://www.google.com.hk/search?"
      @regex = Regexp.new(/(\s|\w)*<em>(\w)*<\/em\>(\s|\w)*/)
    else
      @base = "https://www.google.com/search?"
      @regex = Regexp.new(/(\s|\w)*<b><i>(\w)*<\/i\><\/b\>(\s|\w)*/)
    end
  end
end

begin
  require 'rails'
rescue LoadError
  #do nothing
end