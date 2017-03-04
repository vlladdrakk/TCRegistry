class CategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
  	Category.create(category_params)
  end

  def destroy
    Category.find(params[:id]).destroy
  end

  def category_params
  	params.permit(:id, :name, :description)
  end
end