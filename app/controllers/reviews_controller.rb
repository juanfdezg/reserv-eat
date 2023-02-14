# frozen_string_literal: true

# Controller for Reviews
class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurants_path(anchor: 'portfolio')
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:id])
    @review.update(review_params)

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :edit

    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end
end
