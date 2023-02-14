# frozen_string_literal: true

# Controller for Restaurant
class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  def index
    @restaurants = Restaurant.all

    @restaurants = @restaurants.filter_by_commune(params[:commune]) if params[:commune].present?
    @restaurants = @restaurants.filter_by_food(params[:food]) if params[:food].present?
    @restaurants = @restaurants.filter_by_rating(params[:rating]) if params[:rating].present?
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    if @restaurant.save
      redirect_to restaurants_path(anchor: 'portfolio')
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    @restaurant.update(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_path(anchor: 'portfolio')
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path(anchor: 'portfolio')
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :commune, :open, :close, :rating, :food, :logo, :slogan, :description)
  end
end
