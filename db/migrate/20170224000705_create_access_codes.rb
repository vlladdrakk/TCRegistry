class CreateAccessCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :access_codes do |t|
      t.integer :code
      t.boolean :active
      t.timestamps
    end
  end
end
