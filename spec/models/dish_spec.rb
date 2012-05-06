require 'spec_helper'

describe Dish do


  it 'should always have title' do
    @dish = Fabricate.build(:dish)

    @dish.title = ''
    @dish.valid?.should be_false
    @dish.title = 'cheese'
    @dish.valid?.should be_true
  end

  it 'always should have at least one ingredient' do
    @dish = Fabricate.build(:dish, ingredients: [])

    @dish.valid?.should be_false

    @dish.add_ingredient(title: 'ser')
    @dish.valid?.should be_true
  end

  it 'can add ingredients' do
    @dish = Fabricate.build(:dish)

    ing0 = @dish.ingredients.first
    ing1 = @dish.add_ingredient(title: 'cheese')
    ing2 = @dish.add_ingredient(title: 'beacon')

    @dish.ingredients.should eq([ing0,ing1,ing2])
  end

  it 'can delete ingredient by id' do
    @dish = Fabricate(:dish)
    ing = @dish.ingredients.first

    @dish.remove_ingredient(ing.id)
    @dish.reload

    @dish.ingredients.size.should == 0
  end

  it "can't delete ingredient by wrong argument" do 
    @dish = Fabricate.build(:dish)

    lambda {@dish.remove_ingredient("very wrong argument 123")}.should raise_error(BSON::InvalidObjectId)
  end

  it 'should be valid with many prices' do
    @dish = Fabricate.build(:dish, prices: [])

    price1 = Fabricate.attributes_for(:price, title: 'medium')
    price2 = Fabricate.attributes_for(:price, title: 'large')
    @dish.add_price(price1)
    @dish.add_price(price2)

    @dish.valid?.should be_true
    @dish.prices.size.should == 2
  end

  it "shouldn't be valid without price" do
    @dish = Fabricate.build(:dish, prices: [])

    @dish.valid?.should be_false
    @dish.errors.messages.should == {:prices=>["dish should have at least one prices"]}
  end

  it 'can delete price by id' do
    @dish = Fabricate(:dish)

    price = @dish.prices.first
    price2 = Fabricate.build(:price)
    @dish.add_price(price2.as_json)

    @dish.remove_price(price.id)
    @dish.prices.should == [price2]  
  end

  pending "can't have same prices"
end
