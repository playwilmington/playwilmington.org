class AddCalendarHelpToSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :calendar_help_text, :text
  end
end
