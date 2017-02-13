class Admin::ApplicationController < ActionController::Base
  before_action :authorize
    protect_from_forgery with: :exception
    layout "admin"
  def current_moderator
    @moderator ||= Moderator.find(session[:current_moderator_id]) if session[:current_moderator_id]
  end

  def authorize
    unless current_moderator
    redirect_to '/login', alert: "Please login to your admin pages"
  end
end

end
