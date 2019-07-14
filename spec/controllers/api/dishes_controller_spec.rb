require 'rails_helper'

RSpec.describe Api::DishesController, type: :controller do
  let(:restaurant1)                 { FactoryBot.create(:restaurant) }  
  let(:restaurant2)                 { FactoryBot.create(:restaurant) }  
  let(:dish1)                       { FactoryBot.create(:dish, restaurant_id: restaurant1.id) }  
  let(:dish2)                       { FactoryBot.create(:dish, restaurant_id: restaurant1.id) } 

  describe "GET" do
    before do
      dish1.restaurant_id = 1
      dish1.save

      dish2.restaurant_id = 1
      dish1.save

      restaurant1.dish_id = 1
      restaurant1.save
    end

    describe "#index" do
      it "should return http success 200" do
        get :index
        expect(response.status).to eq(200)
      end
  
      it "should render dishes correctly" do
        get :index
        result = JSON.parse(response.body)
        data = [
          { id: 1, name: dish1.name },
          { id: 2, name: dish2.name }
        ]
        expect(result['dishes'].to_json).to eq(data.to_json)
        expect(response.successful?).to eq(true)
      end

      it "should render dishes of restaurants correctly" do
        get :index, params: {
          restaurant_id: 1
        }
        result = JSON.parse(response.body)
        data = [
          { id: 1, name: dish1.name },
          { id: 2, name: dish2.name }
        ]
        expect(result['dishes'].to_json).to eq(data.to_json)
        expect(response.successful?).to eq(true)
      end
    end

    describe "#show" do
      it "should return http success 200, when id is correct" do
        get :show, params: {
          id: 1
        }
        result = JSON.parse(response.body)
        data =  { id: 1, name: dish1.name }
      
        expect(result['dish'].to_json).to eq(data.to_json)
        expect(response.successful?).to eq(true)
      end
    end
  end

end
