class AddFkToRegistryItem < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :registry_items, :categories, column: :category_id
  end
end
