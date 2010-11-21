# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mybabysit_session',
  :secret      => '88c42cc2f6a8c0c0b9b6162a8d64d7675ef4772a27d59fd794d1110710a6b002a485f7cff6dcc6ea9d1a826843986eb16926e22adc122a7f89da25f01cdd26d3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
