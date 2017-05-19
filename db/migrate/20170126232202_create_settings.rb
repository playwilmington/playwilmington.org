class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.string :address
      t.string :company_name
      t.string :copyright
      t.string :email
      t.string :phone
      t.string :facebook_handle
      t.string :twitter_handle
      t.string :pinterest_handle
      t.string :instagram_handle

      t.timestamps
    end
  end
end
