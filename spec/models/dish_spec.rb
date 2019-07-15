require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
  
  describe 'associations' do
    it { should belong_to(:restaurant) }
    it { should have_many(:restaurants) }
  end
end
