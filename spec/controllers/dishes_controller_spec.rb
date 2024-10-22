require 'spec_helper'

describe DishesController do
  it 'get index should return dishes assigned to category' do
    category = Fabricate(:category)

    get :index, category_id: category.id, format: :json
    response.body.should be_json_eql(category.dishes.to_json )
    response.body.should have_json_size(1)
  end

  it 'get show should return specific dish from passed category' do
    category = Fabricate(:category)
    dish = category.dishes.first

    get :show, category_id: category.id, id: dish.id, format: :json
    response.body.should be_json_eql(dish.to_json)
  end 


  
  it 'post create should create new dish assigned to correct category' do
    category = Fabricate(:category, :dishes => [])
    dish = Fabricate(:dish)
    post :create, category_id: category.id, dish: dish.as_json, format: :json

    response.body.should be_json_eql(dish.to_json)
  end



  it "put update should update an existing dish" do
    category = Fabricate(:category)
    dish = category.dishes.first

    put :update, category_id: category.id, id: dish.id, dish: {title: 'Changed title'}, format: :json
    response.status.should eql(200)
    dish.reload
    dish.title.should eql("Changed title")
  end

  it "delete destroy should destroy an existing dish" do
    category = Fabricate(:category)
    dish = category.dishes.first

    expect {delete :destroy,category_id: category.id , id: dish.id, format: :json }.to change(Dish, :count).by(-1)
    response.status.should == 204
  end



end
