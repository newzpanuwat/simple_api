class Api::DishesController < ApplicationController
  before_action :set_dish, only: [:show]

  def index
    @dishes = Dish.all

    render json: @dishes
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
    render json: @dish
  end


  private 

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:name)
  end
  
end
