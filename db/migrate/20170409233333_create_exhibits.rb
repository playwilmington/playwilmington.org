class CreateExhibits < ActiveRecord::Migration[5.0]
  def change
    create_table :exhibits do |t|
      t.string :title
      t.string :icon
      t.string :description
      t.belongs_to :page
      t.boolean :active
      t.integer :order

      t.timestamps
    end
  end
end
