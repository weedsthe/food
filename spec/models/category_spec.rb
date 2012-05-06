require 'spec_helper'

describe Category do


  it "should always have a title" do
    @category = Fabricate.build(:category)

    @category.title = ''
    @category.valid?.should be_false

    @category.title = 'Pasta'
    @category.valid?.should be_true
  end

  it "can add dishesh through a hash" do
    category = Fabricate.build(:category, dishes: [])
    dish = Fabricate.build(:dish)
    
    category.add_dish(dish.as_json)
    category.dishes.should == [dish]
  end

  pending "can't have same dishes"

  it "can delete delete dish through a dish id" do
    category = Fabricate(:category)
    dish = category.dishes.first

    category.remove_dish!(dish.id)
    category.dishes.size.should == 0
  end
end
