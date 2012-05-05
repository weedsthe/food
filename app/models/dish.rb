class Dish
  class IngredientNotExist < StandardError; end

  include Mongoid::Document

  field :title

  belongs_to :category

  embeds_many :ingredients
  embeds_many :prices

  validates :title, presence: true
  validate :min_number_of_ingredients
  validate :min_number_of_prices

  def add_ingredient(attributes)
    ingredients.build(attributes)
  end

  def remove_ingredient(id)
    ing = ingredients.find(id)
    ing.destroy
  end

  def add_price(hash)
    prices.build(hash)
  end

  def remove_price(id)
    price = prices.find(id)
    price.destroy
  end

  private

    def min_number_of_ingredients
      errors[:base] << ("dish should have at least one ingredient") if ingredients.size < 1
    end

    def min_number_of_prices
      errors.add(:prices,"dish should have at least one prices") if prices.size < 1
    end

end
