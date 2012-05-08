require 'spec_helper'

describe CategoriesController do
  it 'get index should return all categories' do
    pizza = Fabricate(:category, title: 'pizza')
    pork = Fabricate(:category, title: 'pork')

    get :index, format: :json
    response.body.should be_json_eql([pizza,pork].to_json)
  end

  it 'get show should return specific category' do
    pizza = Fabricate(:category)

    get :show, id: pizza.id, format: :json
    response.body.should be_json_eql(pizza.to_json)
  end

  it 'post create should create new category' do
    pizza = Fabricate(:category)

    post :create, category: pizza.as_json, format: :json
    response.body.should be_json_eql(pizza.to_json)
  end

  it 'put update should update and existing category' do
    pizza = Fabricate(:category)
    pizza.title = "Peanut butter jelly"

    put :update, id: pizza.id, category: pizza.as_json, format: :json
    response.body.should be_json_eql(pizza.to_json)
  end

  it "delete destroy should destroy an existing category with all it dishes" do
    pizza = Fabricate(:category)

    delete :destroy, id: pizza.id, format: :json 
    response.status.should == 204

    Category.all.count.should == 0
    Dish.all.count.should == 0
  end

end
