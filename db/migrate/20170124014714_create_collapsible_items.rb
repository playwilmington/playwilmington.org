class CreateCollapsibleItems < ActiveRecord::Migration[5.0]
  def change
    create_table :collapsible_items do |t|
      t.string :title
      t.text :body
      t.boolean :active
      t.string :icon
      t.integer :order
      t.belongs_to :collapsible

      t.timestamps
    end
  end
end
