class CreateCollapsibles < ActiveRecord::Migration[5.0]
  def change
    create_table :collapsibles do |t|
      t.string :name
      t.boolean :active, default: false
      t.boolean :is_popout, default: false
      t.string :collapse_style, default: 'accordion'
      t.string :usage_type
      t.integer :order

      t.timestamps
    end
  end
end
