class ManageController < ApplicationController
  def index
  	@items = RegistryItem.all
  	@categories = Category.all
  end
end
