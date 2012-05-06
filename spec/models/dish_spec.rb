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
    @dish.save
    ing.save
    

    @dish.remove_ingredient(ing.id)
    @dish.reload

    @dish.ingredients.size.should == 0
  end

  it "can't delete ingredient by wrong argument" do 
    lambda {@dish.remove_ingredient("very wrong argument 123")}.should raise_error(BSON::InvalidObjectId)
  end

  it 'should be valid with many prices' do
    @dish.prices = []
    price1 = Fabricate.attributes_for(:price, title: 'medium')
    price2 = Fabricate.attributes_for(:price, title: 'large')
    @dish.add_price(price1)
    @dish.add_price(price2)

    @dish.valid?.should be_true
    @dish.prices.size.should == 2
  end

  it "shouldn't be valid without price" do
    @dish.prices =  []

    @dish.valid?.should be_false
    @dish.errors.messages.should == {:prices=>["dish should have at least one prices"]}
  end

  it 'can delete price by id' do
    price = @dish.prices.first
    price2 = Fabricate.attributes_for(:price)
    @dish.add_price(price2)

    @dish.remove_price(price.id)
    @dish.prices.size.should == 1
  end

  pending "can't have same prices"
end
