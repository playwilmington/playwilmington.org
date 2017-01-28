class AddHideTitleToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :hide_title, :boolean
  end
end
