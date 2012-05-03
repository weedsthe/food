class Category
  include Mongoid::Document
  field :title

  has_many :dishes

  validates :title, presence: true
end
