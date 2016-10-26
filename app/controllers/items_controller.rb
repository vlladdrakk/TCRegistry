class ItemsController < ApplicationController
  def index
  	@selectedCategory = nil
  	@categories = Category.all
  	@items = RegistryItem.all.where(category: @selectedCategory)
  end
  def create
  	#Get attributes from parameters
  	itemname = params[:name]
  	needed = params[:needed]
  	pledged = params[:pledged]
  	picture = params[:picture]
  	category = params[:category]

  	#Initialize new registry item
  	newItem = RegistryItems.new(name: itemname,needed: needed, pledged: pledged, picture: picture)
  	newItem.save
  end
end
