class Api::DishesController < ApplicationController
  before_action :set_dish, only: [:show]
  before_action :this_restaurant, only: [:index]

  def index
    if params['restaurant_id'].present?
      @dishes = Dish.where(:restaurant_id => @current_restaurant.ids)
    else
      @dishes = Dish.all
    end
    
    render json: @dishes.to_json(:except => [:created_at, :updated_at])
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      render json: @dish, status: created
    else
      render json: @dish.errors.full_messages, status: unprocessable_entity
    end
  end

  def show
    render json: @dish.to_json(:except => [:created_at, :updated_at, :restaurant_id])
  end


  private 

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:name)
  end

  def this_restaurant
    return if params['restaurant_id'].blank?
    res_id = params['restaurant_id']
    @current_restaurant = Restaurant.where(id: res_id)
  end
  
end
