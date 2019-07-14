class Api::RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  before_action :this_dish, only: [:index]

  def index
    if params['dish_id'].present?
      @restaurants = Restaurant.where(:dish_id => @current_dish.ids)
    else
      @restaurants = Restaurant.all
    end

    render json: @restaurants.to_json(:except => [:created_at, :updated_at, :restaurant_id])

  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      render json: @restaurant, status: created
    else
      render json: @restaurant.errors.full_messages, status: unprocessable_entity
    end
  end

  def show
    render json: @restaurant.to_json(:except => [:created_at, :updated_at])
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

  def this_dish
    return if params['dish_id'].blank?
    dish_id = params['dish_id']
    @current_dish = Dish.where(id: dish_id)
  end

end
