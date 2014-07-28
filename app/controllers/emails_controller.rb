class EmailsController < ApplicationController

  skip_before_filter :authenticate_user, only: :create
  before_action :ensure_admin, except: %w(create)

  def create
    Notifier.receive(params['body-mime'])
    render nothing: true
  end

  #TODO Should this method be here?
  def create_route
    result = Email.create_catch_all
    render text: result, layout: true
  end

  def show_route
     Email.show_routes(limit: 10) 
  end

  private

  def ensure_admin
    unless @logged_in.super_admin?
      render text: t('not_authorized'), layout: true
      false
    end
  end


end
