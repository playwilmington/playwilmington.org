class AddColorToSlider < ActiveRecord::Migration[5.0]
  def change
    add_column :sliders, :color, :string, default: "white"
  end
end
