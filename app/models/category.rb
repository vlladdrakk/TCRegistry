class Category < ApplicationRecord
	has_many :registry_items
  before_destroy :destroy_registry_items

   private

   def destroy_registry_items
     self.registry_items.delete_all
   end
end
