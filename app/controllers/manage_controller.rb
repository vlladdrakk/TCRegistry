class ManageController < ApplicationController
  def index
  	@items = RegistryItem.all
  end
end
