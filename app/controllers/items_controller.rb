require 'open-uri'

class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    selectedCategory = params[:selection]
    @categories = Category.all
    if selectedCategory.nil?
      @items = RegistryItem.where(category_id: Category.first.id)
    else
      selected_id = Category.find(selectedCategory).id
      @items = RegistryItem.where(category_id: selected_id)
   end
  end

  def get
    id = params[:id]
    item = RegistryItem.find(id)
    item_json = item.as_json
    item_json['image_url'] = item.get_url
    render json: item_json
  end

  def claim
    id = params[:id]
    item = RegistryItem.find(id)
    current_needed = item.needed
    updated_needed = current_needed - 1
    item.update(needed: updated_needed)
    render json: {"needed": item.needed}
  end
end
