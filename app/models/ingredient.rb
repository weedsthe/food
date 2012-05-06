class Ingredient
  include Mongoid::Document
  field :title, :type => String

  belongs_to :dish
end
