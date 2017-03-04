class CreateRsvps < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvps do |t|
      t.string :attending
      t.text :comment
      t.timestamps
    end
  end
end
