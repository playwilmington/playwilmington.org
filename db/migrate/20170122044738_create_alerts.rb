class CreateAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :alerts do |t|
      t.string :name
      t.string :title
      t.text :content, default: ''
      t.date :start_date
      t.date :end_date
      t.boolean :active

      t.timestamps
    end
  end
end
