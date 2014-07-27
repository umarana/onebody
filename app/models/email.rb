class Email < ActiveRecord::Base

  include HTTParty

  base_uri 'https://api.mailgun.net/v2'
  basic_auth 'api', C_.mailgun_api_key


end
