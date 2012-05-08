class Category
  include Mongoid::Document
  field :title

  has_many :dishes, autosave: true, dependent: :delete

  validates :title, presence: true

  accepts_nested_attributes_for :dishes

  # Note that for embedded documents this will only check that the 
  #field is unique within the context of the parent document, not the entire database.
  # validates_uniqueness_of :dishes


  def add_dish(attributes)
    dishes.build(attributes)
  end

  def remove_dish(id)
    dish = dishes.find(id)
    dish.destroy
  end

  def remove_dish!(id)
    remove_dish(id)
    save
    reload
  end
end
