require 'active_support/configurable'

module GoogleSpellChecker

  def self.configure(&block)
    yield @config ||= GoogleSpellChecker::Configuration.new
  end

  def self.config 
    @config 
  end

  class Configuration
    include ActiveSupport::Configurable 
    config_accessor :using_hk
  end

  def param_name
    config.param_name.respond_to?(:call) ? config.param_name.call : config.param_name
  end

  # define param_name writer (copied from AS::Configurable)
  writer, line = 'def param_name=(value); config.param_name = value; end', __LINE__
  singleton_class.class_eval writer, __FILE__, line
  class_eval writer, __FILE__, line

  configure do |config|
    config.using_hk = false
  end
end