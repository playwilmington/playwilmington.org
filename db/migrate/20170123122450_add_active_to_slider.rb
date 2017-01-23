class AddActiveToSlider < ActiveRecord::Migration[5.0]
  def change
    add_column :sliders, :active, :boolean
  end
end
