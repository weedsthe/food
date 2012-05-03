class Dish
  include Mongoid::Document

  field :title, :type => String

  embeds_many :ingredients

  

  validates :title, presence: true

  validate :min_number_of_ingredients

  def add_ingredient(attributes)
    ingredients.build(attributes)
  end

  def remove_ingredient(parametrs)
    case parametrs
    when String then remove_by_title(parametrs)
    when Ingredient then remove_by_record(parametrs)
    else
      raise "wrong parametrs class"
    end
  end

  private

    def min_number_of_ingredients
      errors[:base] << ("dish should have at least one ingredient") if ingredients.size < 1
    end

    def remove_by_title(title)
      ing = ingredients.where(title: title)  .first      
      destroy_ingredient(ing)
    end

    def remove_by_record(record)
      ing = ingredients.where(_id: record.id).first
      destroy_ingredient(ing)
    end

    def destroy_ingredient(ingredient)
      unless ingredient && ingredient.destroy
        raise Exceptions::IngredientNotExist.new('nananana')
      end
    end

end
