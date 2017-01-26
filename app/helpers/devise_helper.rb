# frozen_string_literal: true
module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    messages =
      resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
      <ul class='browser-default'>#{messages}</ul>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end
end
