class RegistryItem < ApplicationRecord
	has_many :categories

	has_attached_file :picture,
	:styles => {
      :thumb => "250x250#"}
  	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
