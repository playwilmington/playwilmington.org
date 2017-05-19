class CreateMarkers < ActiveRecord::Migration[5.0]
  def change
    create_table :markers do |t|
      t.string :address
      t.string :title
      t.text :body
      t.string :marker_type
      t.belongs_to :page

      t.timestamps
    end
  end
end
