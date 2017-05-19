class CreateTestimonials < ActiveRecord::Migration[5.0]
  def change
    create_table :testimonials do |t|
      t.string :name
      t.text :quote
      t.string :status, default: "New"

      t.timestamps
    end
  end
end
