class EmailsController < ApplicationController

  skip_before_filter :authenticate_user, only: :create
  before_action :ensure_admin, except: %w(create)

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
    result = HTTParty.post("https://api:#{Site.current.mailgun_apikey}@api.mailgun.net/v2/routes",
                  body: data)
    render result
  end

  private

  def ensure_admin
    unless @logged_in.super_admin?
      render text: t('not_authorized'), layout: true
      false
    end
  end


end
