require 'spec_helper'

describe Category do

  before :each do 
    @category = FactoryGirl.build(:category)
    #@dish = FactoryGirl.build(:dish2)
  end

  it "should always have a title" do
    @category.title = ''
    @category.valid?.should be_false

    @category.title = 'Pasta'
    @category.valid?.should be_true
  end

  it "can add dishesh through a hash" do
    dish = FactoryGirl.build(:pizza)

    @category.add_dish(dish.as_json)
    @category.dishes.size.should == 1

  end

  # it "can add dishesh through an object" do
  #   dish = FactoryGirl.build(:pizza)
  #   @category.add_dish(dish)

  #   @category.dishes.size.should == 1 
  # end

  it "can't have same dishes" do
    dish = FactoryGirl.build(:pizza)
    2.times{ @category.add_dish(dish.as_json) }

    @category.valid?.should be_true
  end

  # it "can delete delete dish through a dish id" do
  #   dish = @category.dishes.first
  #   @category.remove_dish(dish.id)
  #   @category.dishesh.should be_empty
  # end

  # it "can delete delete dish through a dish title" do
  #   dish = @category.dishes.first
  #   @category.remove_dish(dish.title)
  #   @category.dishesh.should be_empty
  # end
end
