class AddDescriptionToRegistryItem < ActiveRecord::Migration[5.0]
  def change
    add_column :registry_items, :description, :text
  end
end
