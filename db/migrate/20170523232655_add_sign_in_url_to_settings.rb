class AddSignInUrlToSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :sign_in_registration_url, :string
  end
end
