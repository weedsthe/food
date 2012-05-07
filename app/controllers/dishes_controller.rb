class DishesController < ApplicationController
  respond_to :json

  before_filter :find_category

  # Talktrough:
  # Mozna rowniez zrobic find_dish tylko nie wiem czy chcesz miec @dish na show i update
  # Bo nie wiem czyc chesz to pozniej udostepniac na widoku

  before_filter :find_dish, only: [:show, :update, :destroy]

  def index
    respond_with @category.dishes
  end

  def show
    respond_with @dish
  end

  def create
    dish = @category.dishes.create(params[:dish])
    respond_with dish, location: category_dish_url(@category,dish)
  end

  def update
    @dish.update_attributes(params[:dish])
    respond_with @dish, location: category_dish_url(@category, @dish)
  end

  def destroy
    @dish.destroy
    respond_with json: @dish, location: category_dishes_url(@category, @dish)
  end

  private

    def find_category
      @category = Category.find(params[:category_id])
    end

    def find_dish
      @dish = @category.dishes.find(params[:id])
    end
end
