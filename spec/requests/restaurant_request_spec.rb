# frozen_string_literal: true

require 'rails_helper'
require 'support/auth_helper'
include AuthHelper

RSpec.describe Restaurant, type: :request do
  before(:each) do
    login_user
  end

  before(:all) do
    @restaurant = create(:restaurant)
    @restaurant.save
  end

  describe 'POST /restaurants' do
    it 'should create a restaurant' do
      expect do
        post restaurants_path, params: {
          restaurant: {
            name: @restaurant.name,
            location: @restaurant.location,
            open: @restaurant.open,
            close: @restaurant.close,
            score: @restaurant.score,
            food: @restaurant.food,
            logo: @restaurant.logo
          }
        }
      end.to change(Restaurant, :count).by(1)
    end

    it 'should not create a restaurant with invalid data' do
      expect do
        post restaurants_path, params: {
          restaurant: {
            name: @restaurant.name,
            location: @restaurant.location,
            open: @restaurant.open,
            close: @restaurant.close,
            score: 'hola',
            food: @restaurant.food,
            logo: @restaurant.logo
          }
        }
      end.to change(Restaurant, :count).by(0)
    end
  end

  describe 'PATCH /restaurants/:id' do
    it 'should update a restaurant\'s food' do
      patch restaurant_path(@restaurant), params: {
        restaurant: {
          name: @restaurant.name,
          location: @restaurant.location,
          open: @restaurant.open,
          close: @restaurant.close,
          score: @restaurant.score,
          food: 'Pizza',
          logo: @restaurant.logo
        }
      }
      expect(Restaurant.find(@restaurant.id).food).to eq('Pizza')
    end

    it 'should not update a restaurant with invalid data' do
      patch restaurant_path(@restaurant), params: {
        restaurant: {
          name: '',
          location: @restaurant.location,
          open: @restaurant.open,
          close: @restaurant.close,
          score: @restaurant.score,
          food: @restaurant.food,
          logo: @restaurant.logo
        }
      }
      expect(Restaurant.find(@restaurant.id).name).to eq(@restaurant.name)
    end
  end

  describe 'DELETE /restaurants/:id' do
    it 'should delete a restaurant' do
      expect do
        delete restaurant_path(@restaurant)
      end.to change(Restaurant, :count).by(-1)
    end
  end
end
