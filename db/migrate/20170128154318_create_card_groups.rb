class CreateCardGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :card_groups do |t|
      t.belongs_to :page
      t.string :grid
      t.boolean :active
      t.integer :order

      t.timestamps
    end
  end
end
