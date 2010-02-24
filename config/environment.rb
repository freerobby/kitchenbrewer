# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem "acl9"
  config.gem "authlogic", :source => "http://gemcutter.org"
  config.gem "calendar_date_select", :source => "http://gemcutter.org"
  config.gem 'hoptoad_notifier'
  config.gem "kete-tiny_mce", :lib => "tiny_mce", :source => "http://gems.github.com"
  config.gem "repeated_auto_complete", :source => "http://gemcutter.org"
  config.gem "searchlogic", :source => "http://gemcutter.org"
  config.gem "will_paginate", :source => "http://gemcutter.org"
  
  config.time_zone = 'UTC'
end

CalendarDateSelect::FORMATS[:american_with_timezone] = {
  :date => "%m/%d/%Y",
  :time => " %I:%M %p %z",
  :javascript_include => "format_american_with_timezone"
}

CalendarDateSelect.format = :american_with_timezone
