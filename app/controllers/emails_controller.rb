class EmailsController < ApplicationController

  skip_before_filter :authenticate_user

  def create
    Notifier.receive(params['body-mime'])
    render nothing: true
  end

  #TODO Should this method be here?
  def create_route
    data = {}
    data[:priority] = 0
    data[:description] = "Catch All Route"
    data[:expression] = "match_recipient('.*@#{Site.current.email_host}')"
    data[:action] = ["forward('http://#{Site.current.host}/emails.mime/')", "stop()"]
    HTTParty.post("https://api:#{Site.current.mailgun_apikey}@api.mailgun.net/v2/routes",
                  :body => data)
  end

end
