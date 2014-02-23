$:.push File.expand_path("../lib",__FILE__)
require 'google_spell_checker/version'

Gem::Specification.new do |s|
	s.name          = 'google_spell_checker'
  s.version       = GoogleSpellChecker::VERSION
	s.date          = '2014-02-18'
	s.summary       = 'Google spell checker'
	s.description   = 'A simple spell checking gem using google'
	s.authors       = ['Michael Ji']
	s.email         = 'zilong@gmail.com'
	s.homepage = 'https://github.com/apprentice1988/google_spell_checker.git'
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']
end