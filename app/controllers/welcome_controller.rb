class WelcomeController < ApplicationController
  def index
  	#@selectedCategory = nil
  	@categories = Category.all
  	@items = RegistryItem.all #.where(category: @selectedCategory)
  end
end
