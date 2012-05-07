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


  context "new dish with valid input" do
    it 'post create should create new dish assigned to correct category' do
      category = Fabricate(:category, :dishes => [])
      dish = Fabricate(:dish)
      post :create, category_id: category.id, dish: dish.as_json, format: :json

      response.body.should be_json_eql(dish.to_json)
    end

    it "should redirect" do
      category = Fabricate(:category)
      dish = category.dishes.first
      post :create, category_id: category.id, dish: dish.as_json, format: :json

      response.header['Location'].should include category_dish_path(dish.category, dish)
      response.header['Content-Type'].should include 'application/json'
    end

  end

  context "update dish with valid input" do
    it "put update should update an existing dish" do
      category = Fabricate(:category)
      dish = category.dishes.first

      put :update, category_id: category.id, id: dish.id, dish: dish.as_json, format: :json
      response.body.should be_json_eql(dish.to_json)
    end
  end

  context "destroy dish with valid id" do
    it "should redirect" do
      category = Fabricate(:category)
      dish = category.dishes.first

      delete :destroy, category_id: category.id, id: dish.id, format: :json 
      response.status.should == 204

      category.reload
      category.dishes.include?(dish).should be_false
    end
  end

end
