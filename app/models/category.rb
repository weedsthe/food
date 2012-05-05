class Category
  include Mongoid::Document
  field :title

  has_many :dishes

  validates :title, presence: true


  # Note that for embedded documents this will only check that the 
  #field is unique within the context of the parent document, not the entire database.
  validates_uniqueness_of :dishes


  def add_dish(attributes)
    dishes.build(attributes)
  end
end
