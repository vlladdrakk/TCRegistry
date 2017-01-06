class ItemsController < ApplicationController
  def create
    # get the item information from the parameters
    item_name = params[:name]
    needed = params[:needed]
    image = params[:image]
    description = params[:description]
    category = params[:category]

    newItem = RegistryItem.new(
      name: item_name,
      needed: needed,
      pledged: 0,
      picture: image,
      description: description,
      category_id: category
    )
    newItem.save

    # redirect to management interface
    redirect_to action: "manage"
  end

  def delete
    id = params[:id]
    item = RegistryItem.find(id)
    item.delete()
    item.save()
  end

  def get
    id = params[:id]
    item = RegistryItem.find(id)
    render json: item.as_json
  end  

  def update
    render "testing"
  end
end
