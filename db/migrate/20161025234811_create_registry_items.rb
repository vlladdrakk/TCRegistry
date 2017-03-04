class CreateRegistryItems < ActiveRecord::Migration[5.0]
  def change
    create_table :registry_items do |t|
      t.string :name
      t.integer :needed
      t.integer :pledged
      t.string :picture

      t.timestamps
    end
  end
end
