class CreateContantEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_emails do |t|
      t.belongs_to :page
      t.string :title
      t.string :email_address
      t.boolean :active
      t.integer :order

      t.timestamps
    end
  end
end
