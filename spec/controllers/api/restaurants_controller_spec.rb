require 'rails_helper'

RSpec.describe Api::RestaurantsController, type: :controller do
  let(:restaurant1)                 { FactoryBot.create(:restaurant) }  
  let(:restaurant2)                 { FactoryBot.create(:restaurant) }  
  let(:restaurant3)                 { FactoryBot.create(:restaurant) }  
  let(:dish1)                       { FactoryBot.create(:dish, restaurant_id: restaurant1.id) }  
  let(:dish2)                       { FactoryBot.create(:dish, restaurant_id: restaurant1.id) } 
  let(:dish3)                       { FactoryBot.create(:dish, restaurant_id: restaurant2.id) } 

  describe "GET" do
    before do
     restaurant1.dish_id = 1
     restaurant2.dish_id = 2
    end

    describe "#index" do
      it "should return http success 200" do
        get :index
        expect(response.status).to eq(200)
      end
  
      it "should render restaurants correctly" do
        get :index
        result = JSON.parse(response.body)
        data = [
          { id: 1, name: restaurant1.name },
          { id: 2, name: restaurant2.name }
        ]
        expect(result['restaurants'].to_json).to eq(data.to_json)
        expect(response.successful?).to eq(true)
      end
    end
    
    describe "#show" do
      it "should return http success 200, when id is correct" do
        get :show, params: {
          id: 1
        }
        result = JSON.parse(response.body)
        data =  { id: 1, name: restaurant1.name }
      
        expect(result['restaurant'].to_json).to eq(data.to_json)
        expect(response.successful?).to eq(true)
      end

    end
  end

end
