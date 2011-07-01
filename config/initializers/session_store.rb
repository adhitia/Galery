# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_galery_session',
  :secret      => '0aae85e6ee6c0b87853717b42c8b40bfb4e2284f849a139b8bc05b696509dadedc11d596f862be6bc00fa782f51edb5c9cdf7648fb37ca59fd6f8d7df069016b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
