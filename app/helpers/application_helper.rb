module ApplicationHelper
  def admin?
    controller.class.name.split('::').first == 'Admin'
  end

  def date_picker(field)
    return if field.blank?

    field.to_formatted_s(:date_picker)
  end

  def options_page_type(value)
    options_for_select(%w(Page Tab), value)
  end

  def options_positions(value)
    options_for_select(%w(center-align right-align left-align), value)
  end

  def options_available_pages(value)
    options_from_collection_for_select(Page.available_pages, :id, :title, value)
  end

  def viewable?
    case controller_name
    when 'sessions', 'registrations', 'passwords', 'confirmations', 'unlocks'
      true
    else
      false
    end
  end

  def forgot_password?
    if devise_mapping.recoverable? && controller_name != 'passwords' &&
       controller_name != 'registrations'
      true
    else
      false
    end
  end

  def unlock?
    if devise_mapping.lockable? &&
       resource_class.unlock_strategy_enabled?(:email) &&
       controller_name != 'unlocks'
      true
    else
      false
    end
  end
end
