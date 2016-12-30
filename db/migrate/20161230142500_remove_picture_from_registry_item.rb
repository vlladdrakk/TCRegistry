class RemovePictureFromRegistryItem < ActiveRecord::Migration[5.0]
  def change
  	remove_column :registry_items, :picture
  end
end
