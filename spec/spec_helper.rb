# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path(File.join(File.dirname(__FILE__),'..','config','environment'))
require 'spec/autorun'
require 'spec/rails'
require 'authlogic/test_case'

RESPONSE_UNAUTHORIZED = 401
RESPONSE_REDIRECT = 302

# Uncomment the next line to use webrat's matchers
#require 'webrat/integrations/rspec-rails'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

Spec::Runner.configure do |config|
end

def fake_login(user)
  controller.stub!(:current_profile_session).and_return(UserSession.create(user))
end

def login(user)
  logout
  UserSession.create(user)
end

def logout
  UserSession.find.destroy
end