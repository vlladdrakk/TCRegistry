class AddCategoryToRegistryItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :registry_items, :category, foreign_key: true
  end
end
