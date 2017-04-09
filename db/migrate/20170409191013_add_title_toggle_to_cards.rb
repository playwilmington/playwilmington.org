class AddTitleToggleToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :toggle_title, :boolean
  end
end
