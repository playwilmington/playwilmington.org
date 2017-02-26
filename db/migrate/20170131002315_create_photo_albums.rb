class CreatePhotoAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :photo_albums do |t|
      t.string :title
      t.belongs_to :page
      t.integer :order
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
