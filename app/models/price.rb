class Price
  include Mongoid::Document
  field :title, :type => String
  field :value, :type => Float

  validates :value, presence: true
  validates :title, presence: true, uniqueness: true
  embedded_in :dish
end
