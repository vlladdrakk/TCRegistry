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

  def create
    image = nil
    # get the item information from the parameters
    item_name = params[:name]
    needed = params[:needed]
    image_file = params[:image]
    image_url = params[:image_url]
    description = params[:description]
    category = params[:category]

    puts "image: #{image}"
    puts "image_url: #{image_url}"

    if image_url.nil?
      image = image_file
    else
      image = get_url_image(image_url)
    end


    newItem = RegistryItem.create(
      name: item_name,
      needed: needed,
      pledged: 0,
      picture: image,
      description: description,
      category_id: category
    )

    # redirect to management interface
    redirect_to action: "manage"
  end

  def delete
    id = params[:id]
    item = RegistryItem.find(id)
    item.delete()
    item.save()
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

  private

  def get_url_image image_url
    return open(image_url)
  end
end
