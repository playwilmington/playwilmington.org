class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :card_content
      t.text :card_reveal
      t.integer :order
      t.boolean :active
      t.string :size
      t.boolean :sticky_links
      t.string :btn_one_name
      t.string :btn_one_url
      t.string :btn_two_name
      t.string :btn_two_url
      t.belongs_to :card_group
      t.attachment :card_image

      t.timestamps
    end
  end
end
