google_spell_checker
====================

###Intro

This gem is using google to check word's spelling.


###Installation

```
gem 'google_spell_checker','0.0.0'
```

and run the `bundle` command.

###Examples

```
GoogleSpellChecker.check 'take m to your heatr'
=> "take <em>me</em> to your <em>heart</em>"
```

If there is no incorrect word, it will output void character. 
