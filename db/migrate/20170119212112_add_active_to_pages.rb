class AddActiveToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :active, :boolean, default: false
  end
end
