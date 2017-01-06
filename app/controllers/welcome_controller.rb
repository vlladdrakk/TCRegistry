class WelcomeController < ApplicationController
  def index
  	selectedCategory = params[:selection] 
  	@categories = Category.all
  	if selectedCategory.nil?
  		@items = RegistryItem.where(category_id: 1)
  	else
  		selected_id = Category.where(name: selectedCategory)[0]
  		pp selected_id
  		selected_id = selected_id.id
	  	@items = RegistryItem.where(category_id: selected_id)
	  	p "items"
	  	pp @items
	end
  end
end
