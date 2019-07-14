require 'rails_helper'

RSpec.describe Api::RestaurantsController, type: :controller do
  let(:restaurant1)                 { FactoryBot.create(:restaurant) }  

  describe "GET #index" do
    before do
      get :index
    end

    it "should return http success 200" do
      expect(response.status).to eq(200)
    end

  end
end
