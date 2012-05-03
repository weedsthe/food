require 'spec_helper'

describe Dish do

  it 'should always have title' do
    dish = Dish.new()
    dish.valid?.should be_false
    dish.title = 'cheese'
    dish.valid?.should be_true
  end

  it 'always should have at least one ingredient' do
    dish = Dish.new(title: 'pizza')
    dish.valid?.should be_false

    dish.add_ingredient(title: 'ser')
    dish.valid?.should be_true
  end

  it 'can add ingredients' do
    dish = Dish.new(title: 'pizza')
    ing1 = dish.add_ingredient(title: 'cheese')
    ing2 = dish.add_ingredient(title: 'beacon')

    dish.ingredients.should eq([ing1,ing2])
  end

  it 'can delete ingredient by title' do
    dish = Dish.new(title: 'pizza')
    ing = dish.add_ingredient(title: 'cheese')

    dish.remove_ingredient(ing.title)
    dish.ingredients.should be_empty
  end

  it 'can delete ingredient by record' do
    dish = Dish.new(title: 'pizza')
    ing1 = dish.add_ingredient(title: 'cheese')
    ing2 = dish.add_ingredient(title: 'beacon')

    dish.remove_ingredient(ing2)
    dish.ingredients.should eq([ing1])
  end

  it "can't delete ingredient by wrong title" do
    dish = Dish.new(title: 'pizza')
    
    lambda {dish.remove_ingredient('abc')}.should raise_error(Dish::IngredientNotExist)
  end

end
