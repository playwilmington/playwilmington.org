# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_nav_links, :get_alerts, :set_settings

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def admin?
    current_user.admin?
  end

  private

  def set_nav_links
    @pages = Page.main
  end

  def get_alerts
    @alert = Alert.active_alerts.first
  end

  def set_settings
    @settings = Setting.first
  end
end
