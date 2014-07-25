require 'net/http'
class EmailsController < ApplicationController
  #TODO Should this method be here?
  def create_route
    data[:priority] = 0
    data[:description] = "Sample route"
    data[:expression] = "match_recipient('.*@#{Site.current.email_host}')"
    data[:action] = ["forward('http://#{Site.current.host}/email/')", "stop()"]
    post "https://api:#{Site.current.mailgun_apikey}"\
    "@api.mailgun.net/v2/routes", data
  end
  # Don't forget to create a route that forwards everything to /email
  def create(email)
    Notifier.receive(email)
    # Returned text is ignored but HTTP status code matters:
    # Mailgun wants to see 2xx, otherwise it will make another attempt in 5 minutes
    return HttpResponse('OK')
  end

end
