# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dish do
    title "Pizza"
    ingredients { [FactoryGirl.build(:cheese)] }
  end
end
