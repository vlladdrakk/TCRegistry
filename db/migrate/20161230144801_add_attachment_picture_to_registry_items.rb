class AddAttachmentPictureToRegistryItems < ActiveRecord::Migration
  def self.up
    change_table :registry_items do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :registry_items, :picture
  end
end
