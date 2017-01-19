class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.text :content
      t.string :title, null: false, unique: true
      t.string :icon
      t.string :page_type
      t.belongs_to :page
      t.integer :order
      t.string :name, null: false

      t.timestamps
    end
    add_index :pages, :name, unique: true
  end
end
