require 'rails_helper'

RSpec.describe Api::RestaurantsController, type: :controller do
  describe "GET #index" do
    let(:restaurant1)                 { FactoryBot.create(:restaurant) }  

    before do
      get :index
    end

    it "should return http success 200" do
      expect(response.status).to eq(200)
    end
    
  end
end
