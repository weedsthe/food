class DishesController < ApplicationController
  respond_to :json

  before_filter :find_category

  def index
    respond_with @category.dishes
  end

  def show
    dish = @category.dishes.find(params[:id])
    respond_with dish
  end

  def create
    dish = @category.dishes.create(params[:dish])
    respond_with dish, location: category_dish_url(@category,dish)
  end

  private

    def find_category
      @category = Category.find(params[:category_id])
    end
end
