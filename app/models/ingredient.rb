class Ingredient
  include Mongoid::Document
  field :title, :type => String

  embedded_in :dishes
end