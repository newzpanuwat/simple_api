class Api::RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  before_action :this_dish, only: [:index]

  def index
    if params['dish_id'].present?
      @restaurants = Restaurant.where(:dish_id => @current_dish.ids)
    else
      @restaurants = Restaurant.all
    end
    render json: { restaurants: @restaurants.as_json(:except => [:created_at, :updated_at, :dish_id]), status: 200 } 

  end

  def show
    render json: { restaurant: @restaurant.as_json(:except => [:created_at, :updated_at, :dish_id]), status: 200 }
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def this_dish
    return if params['dish_id'].blank?
    dish_id = params['dish_id']
    @current_dish = Dish.where(id: dish_id)
  end

end
