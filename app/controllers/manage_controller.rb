class ManageController < ApplicationController
  def index
  	selection = params[:selection]
  	if selection.nil?
	  	@items = RegistryItem.all
    else
      @items = RegistryItem.where(category_id: selection)
    end

  	@categories = Category.all
  end
end
