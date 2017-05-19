class AddTypeToCardGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :card_groups, :usage_type, :string
  end
end
