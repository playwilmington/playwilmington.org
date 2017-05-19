class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.string :title
      t.integer :order
      t.string :icon
      t.string :link
      t.boolean :is_header
      t.boolean :active
      t.belongs_to :page, foreign_key: true

      t.timestamps
    end
  end
end
