class CategoriesController < ApplicationController
  respond_to :json

  before_filter :find_category, only: [:show, :update, :destroy]

  def index
    respond_with Category.all
  end

  def show
    respond_with @category
  end

  def create
    respond_with Category.create(params[:category])
  end

  def update
    @category.update_attributes(params[:category])
    respond_with @category # Nie wiem czy tu wogole jakies przekierowanie
  end

  def destroy
    @category.destroy
    respond_with @dish #Znowu nie wiem co z przekierowaniem
  end

  private

    def find_category
      @category = Category.find(params[:id])
    end
end
