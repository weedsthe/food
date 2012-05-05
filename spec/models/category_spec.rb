require 'spec_helper'

describe Category do

  before :each do 
    @category = Fabricate.build(:category)
  end

  it "should always have a title" do
    @category.title = ''
    @category.valid?.should be_false

    @category.title = 'Pasta'
    @category.valid?.should be_true
  end

  it "can add dishesh through a hash" do
    dish = Fabricate.build(:dish)
    
    @category.add_dish(dish.as_json)
    @category.dishes.size.should == 2
  end

  # it "can't have same dishes" do
  #   dish = Fabricate.build(:dish) 
  #   2.times{ @category.add_dish(dish.as_json) }

  #   @category.valid?.should be_false
  # end

  it "can delete delete dish through a dish id" do
    dish = @category.dishes.first
    dish.save

    @category.remove_dish!(dish.id)
    @category.dishes.size.should == 0
  end
end
