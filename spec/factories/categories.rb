# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    title "Pasta"
    #dishes { [FactoryGirl.build(:dish)] }
  end
end
