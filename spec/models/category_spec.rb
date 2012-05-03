require 'spec_helper'

describe Category do

  before :each do 
    @category = FactoryGirl.create(:category)
    @dish = FactoryGirl.create(:dish2)
  end

  it "should always have a title" do
    @category.title = ''
    @category.valid?.should be_false

    @category.title = 'Pasta'
    @category.valid?.should be_true
  end

  it "can add dishesh through a hash" do
    @category.add_dish({title: 'Hamburger', ingredients: [ { title: 'bacon' } ] })
    @category.dishes.size.should == 2
  end

  it "can add dishesh through an object" do
    @category.add_dish(@dish)
    @category.dishes.size.should == 2
  end

  it "can't have same dishes" do
    2.times { @category.add_dish(@dish) }
    @category.valid?.should be_false
  end

  it "can delete delete dish through a dish id" do
    dish = @category.dishes.first
    @category.remove_dish(dish.id)
    @category.dishesh.should be_empty
  end

  it "can delete delete dish through a dish title" do
    dish = @category.dishes.first
    @category.remove_dish(dish.title)
    @category.dishesh.should be_empty
  end
end
