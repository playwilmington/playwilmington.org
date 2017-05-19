class RemoveForeignKeyCollections < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key "collections", "pages"
  end
end
