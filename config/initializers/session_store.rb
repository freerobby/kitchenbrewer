# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_kitchenbrewer_session',
  :secret      => 'a6bc29c13ef16c446f94bdd57f976b746fff3184b822e0252ad5be9df0309dcea513dcc210f0148349536985ef0b7c50c9749fbc5b19a1438ad6133e846000af'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
