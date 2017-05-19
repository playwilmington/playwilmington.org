class AddDonationLinkToSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :donation_url, :string
  end
end
