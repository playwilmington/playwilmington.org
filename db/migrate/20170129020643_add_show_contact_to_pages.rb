class AddShowContactToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :show_contact, :boolean
  end
end
