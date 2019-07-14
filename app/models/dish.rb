class Dish < ApplicationRecord
  validates :name, presence: true
  belongs_to :restaurant
end
