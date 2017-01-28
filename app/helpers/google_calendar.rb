# frozen_string_literal: true
module GoogleCalendar
  module_function

  def api_key
    ENV["CALENDAR_API_KEY"]
  end
end
