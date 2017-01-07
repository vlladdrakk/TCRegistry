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
    item_json = item.as_json
    item_json['image_url'] = item.get_url
    render json: item_json
  end

  def update
    item_name = params[:edit_name]
    item_description = params[:edit_description]
    item_category = params[:edit_category]
    item_image = params[:edit_image]
    item_needed = params[:edit_needed]
    item_id = params[:item_id]
    item = RegistryItem.find(item_id)
    begin
      item.update(
        name: item_name,
        needed: item_needed,
        category_id: item_category,
        picture: item_image,
        description: item_description
      )
      render json: {result: true}
    rescue
      render json: {result: false}
    end
  end
end
