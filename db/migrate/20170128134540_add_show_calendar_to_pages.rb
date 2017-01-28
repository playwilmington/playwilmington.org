class AddShowCalendarToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :show_calendar, :boolean
  end
end
