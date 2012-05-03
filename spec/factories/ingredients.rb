# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cheese, class: Ingredient do
    title "Cheese"
  end

  factory :tomatoe, class: Ingredient do
    title "Tomatoe"
  end

  factory :ham, class: Ingredient do
    title "Ham"
  end
end
