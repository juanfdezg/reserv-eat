# frozen_string_literal: true

# Controller for tables
class TablesController < ApplicationController
  before_action :authenticate_user!
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @table = Table.new(table_params)
    @table.restaurant = @restaurant
    if @table.save
      redirect_to restaurants_path(anchor: 'portfolio')
    else
      render :new
    end
  end

  def edit
    @table = Table.find(params[:id])
  end

  def update
    @table = Table.find(params[:id])
    @table.update(table_params)

    if @table.save
      redirect_to tables_path
    else
      render :edit

    end
  end

  def destroy
    @table = Table.find(params[:id])
    if !@table.reservation_id.blank?
      @reservation = Reservation.find(@table.reservation_id)
      @reservation.destroy
    end
    @table.destroy
    redirect_to tables_path
  end

  def index
    @tables = Table.all
  end

  private

  def table_params
    params.require(:table).permit(:nombre_restaurant, :capacidad, :ubicacion, :disponibilidad, :fumador)
  end
end
