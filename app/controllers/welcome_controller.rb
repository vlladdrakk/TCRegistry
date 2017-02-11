class WelcomeController < ApplicationController
  def index
  	selectedCategory = params[:selection]
  	@categories = Category.all
  	if selectedCategory.nil?
  		@items = RegistryItem.where(category_id: 1)
  	else
  		selected_id = Category.find(selectedCategory).id
	  	@items = RegistryItem.where(category_id: selected_id)
	 end
  end
end
