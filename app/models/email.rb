class Email < ActiveRecord::Base

  include HTTParty

  APIKEY = Setting.get(:email, :apikey)

  base_uri 'https://api.mailgun.net/v2'
  basic_auth 'api', APIKEY

  def self.show_routes(skip: 1, limit: 1)
    self.get("/routes", params: {skip: skip, limit: limit})
  end

  def self.create_catch_all
    data = {}
    data[:priority] = 0
    data[:description] = "Catch All Route"
    data[:expression] = "match_recipient('.*@#{Site.current.email_host}')"
    data[:action] = ["forward('http://#{Site.current.host}/emails.mime')", "stop()"]
    self.post("https://api:#{APIKEY}@api.mailgun.net/v2/routes", body: data)
  end

end
