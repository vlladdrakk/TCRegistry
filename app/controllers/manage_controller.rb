class ManageController < ApplicationController
  before_action :authenticate_admin!

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


    if image_url.empty? && !image_file.nil?
      image = image_file
    elsif image_file.nil? && !image_url.empty?
      image = get_url_image(image_url)
    else
      image = open("#{Rails.root}/public/images/placeholder.jpg")
    end


    newItem = RegistryItem.create(
      name: item_name,
      needed: needed,
      pledged: 0,
      picture: image,
      description: description,
      category_id: category
    )
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
    image_file = params[:edit_image]
    image_url = params[:edit_image_url]
    item_needed = params[:edit_needed]
    item_id = params[:item_id]
    image = nil

    puts "image url"
    pp image_url

    if image_url.empty? && !image_file.nil?
      image = image_file
    elsif image_file.nil? && !image_url.empty?
      image = get_url_image(image_url)
    else
      image = open("#{Rails.root}/public/images/placeholder.jpg")
    end

    item = RegistryItem.find(item_id)
    begin
      item.update(
        name: item_name,
        needed: item_needed,
        category_id: item_category,
        picture: image,
        description: item_description
      )
      render json: {result: true}
    rescue
      render json: {result: false}
    end
  end

  private

  def get_url_image image_url
    return open(image_url) unless image_url.empty?
    return nil
  end
end
