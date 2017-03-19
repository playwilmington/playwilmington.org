# frozen_string_literal: true
module ApplicationHelper
  def admin?
    controller.class.name.split("::").first == "Admin"
  end

  def date_picker(field)
    return if field.blank?
    field.to_formatted_s(:date_picker)
  end

  def viewable?
    %w(
      sessions registrations passwords confirmations unlocks
    ).include? controller_name
  end

  def forgot_password?
    devise_mapping.recoverable? &&
    !(%w(passwords registrations).include? controller_name)
  end

  def unlock?
    devise_mapping.lockable? &&
    resource_class.unlock_strategy_enabled?(:email) &&
    controller_name != "unlocks"
  end
end
