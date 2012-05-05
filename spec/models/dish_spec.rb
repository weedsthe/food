require 'spec_helper'

describe Dish do

  before :each do
    @dish = Fabricate.build(:dish)
  end

  it 'should always have title' do
    @dish.title = ''
    @dish.valid?.should be_false
    @dish.title = 'cheese'
    @dish.valid?.should be_true
  end

  it 'always should have at least one ingredient' do
    @dish.ingredients = []
    @dish.valid?.should be_false

    @dish.add_ingredient(title: 'ser')
    @dish.valid?.should be_true
  end

  it 'can add ingredients' do
    ing0 = @dish.ingredients.first
    ing1 = @dish.add_ingredient(title: 'cheese')
    ing2 = @dish.add_ingredient(title: 'beacon')

    @dish.ingredients.should eq([ing0,ing1,ing2])
  end

  it 'can delete ingredient by id' do
    ing = @dish.ingredients.first
    @dish.remove_ingredient(ing.id)
    
    @dish.ingredients.size.should == 0
  end

  it "can't delete ingredient by wrong argument" do 
    lambda {@dish.remove_ingredient("very wrong argument 123")}.should raise_error(BSON::InvalidObjectId)
  end

end
