class CreateSliders < ActiveRecord::Migration[5.0]
  def change
    create_table :sliders do |t|
      t.string :title
      t.string :subtitle
      t.integer :order
      t.string :position

      t.timestamps
    end
  end
end
