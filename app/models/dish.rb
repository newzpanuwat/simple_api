class Dish < ApplicationRecord
  validates :name, presence: true
  belongs_to :restaurant
  has_many :restaurants
end
