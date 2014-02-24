google_spell_checker
====================

###Intro

This gem is using google to check word's spelling.


###Installation

```
gem 'google_spell_checker','0.2.0'
```

and run the `bundle` command.

####Examples

```
GoogleSpellChecker.check 'take m to your heatr'
=> "take <b><i>me</i></b> to your <b><i>heart</i></b>"
```

If there is no incorrect word, it will output void character. 

### Using 'google.com.hk'

If you can access fluently "google.com.hk" rather than "google.com", you can run the following generator command:

```
% rails g google_spell_checker:config
```

Then uncommented the third line of the generated file 'config/initializers/google_spell_checker_config.rb'.

####Examples

```
GoogleSpellChecker.check 'take m to your heatr'
=> "take <em>me</em> to your <em>heart</em>"
```
