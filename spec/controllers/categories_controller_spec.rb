require 'spec_helper'

describe CategoriesController do
  it 'get index should return all categories' do
    pizza = Fabricate.build(:category, title: 'pizza')
    pork = Fabricate.build(:category, title: 'pork')

    pizza.save
    pork.save

    get :index, format: :json
    response.body.should be_json_eql([pizza,pork].to_json)
  end

  it 'get show should return specific category' do
    pizza = Fabricate.build(:category)
    pizza.save

    get :show, id: pizza.id, format: :json
    response.body.should be_json_eql(pizza.to_json)
  end

  it 'post create should create new category' do
    pizza = Fabricate.build(:category)
    pizza.dishes.each { |d| d.save }

    post :create, category: pizza.as_json, format: :json
    response.body.should be_json_eql(pizza.to_json)
  end
end
