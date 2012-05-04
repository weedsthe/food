class Dish
  class IngredientNotExist < StandardError; end

  include Mongoid::Document

  field :title

  belongs_to :category

  embeds_many :ingredients


  validates :title, presence: true
  validate :min_number_of_ingredients

  def add_ingredient(attributes)
    ingredients.build(attributes)
  end

  def remove_ingredient(id)
    ing = ingredients.where(_id: id).first
    unless ing && ing.destroy
      raise IngredientNotExist.new
    end
  end

  private

    def min_number_of_ingredients
      errors[:base] << ("dish should have at least one ingredient") if ingredients.size < 1
    end

end
