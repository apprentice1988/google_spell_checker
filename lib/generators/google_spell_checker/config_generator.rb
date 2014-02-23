module GoogleSpellChecker
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      desc <<DESC
Description:
    Copies GoogleSpellChecker configuration file to your application's initializer directory.
DESC

      def copy_config_file
        template 'google_spell_checker_config.rb', 'config/initializers/google_spell_checker_config.rb'
      end
    end
  end
end