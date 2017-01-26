class AddPageToCollapsibles < ActiveRecord::Migration[5.0]
  def change
    add_reference :collapsibles, :page
  end
end
