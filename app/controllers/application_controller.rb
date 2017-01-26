# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :nav_links
  before_action :alerts

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def admin?
    current_user.admin?
  end

  private

  def nav_links
    @pages = Page.main
  end

  def alerts
    @alert = Alert.active_alerts.first
  end
end
