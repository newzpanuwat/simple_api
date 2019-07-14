class Api::DishesController < ApplicationController
  before_action :set_dish, only: [:show]
  before_action :this_restaurant, only: [:index]

  def index
    dishes_conditional
    render json: { dishes: @dishes.as_json(:except => [:created_at, :updated_at, :restaurant_id]), status: 200 }
  end

  def show
    render json: { dish: @dish.as_json(:except => [:created_at, :updated_at, :restaurant_id]), status: 200 }
  end


  private

  def set_dish
    @dish = Dish.find_by(params[:id])
  end

  def this_restaurant
    return if params['restaurant_id'].blank?
    res_id = params['restaurant_id']
    @current_restaurant = Restaurant.where(id: res_id)
  end

  def dishes_conditional
    if params['restaurant_id'].present?
      @dishes = Dish.where(:restaurant_id => @current_restaurant.ids)
    else
      @dishes = Dish.all
    end
  end
  
end
