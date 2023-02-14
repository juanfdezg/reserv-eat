# frozen_string_literal: true

# Controller for Reservation
class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.restaurant = @restaurant
    @tables = Table.all
    @reserva_correcta = false
    if @reservation.save
      @tables.each do |table|
        next unless table.capacidad >= @reservation.people && table.restaurant_id == @reservation.restaurant_id && 
        table.disponibilidad == true && table.ubicacion == @reservation.ubicacion && table.fumador == @reservation.fumador

        table.reservation_id = @reservation.id
        table.update_attribute(:disponibilidad, false)
        table.save
        ReservationMailer.with(reservation: @reservation).new_reservation_email(current_user.email).deliver_now!
        flash[:success] = "Gracias por tu reserva! Te contactaremos pronto. "
        @reserva_correcta = true
        @reservation.update_attribute(:status, 'aprobada')
        redirect_to restaurants_path(anchor: 'portfolio')
        break
      end
      if !@reserva_correcta
        flash[:error] = 'No hay mesas disponibles para los datos de tu reserva.'
        @reservation.destroy
        redirect_to new_restaurant_reservation_path
      end

    else
      flash[:error] = 'Tu formulario de reservas tiene algunos errores. Por favor revísalo y vuelve a enviar tu solicitud.'
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @id = @reservation.restaurant_id
    @restaurant = Restaurant.find(@id)
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)

    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :edit

    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.aprobada?
      @table = Table.find_by reservation_id: @reservation.id
      @table.update_attribute(:disponibilidad, true)
      @table.update_attribute(:reservation_id, '')
    end
    @reservation.destroy
    redirect_to reservations_path
  end

  def reject_status
    @reservation = Reservation.find(params[:id])
    @reservation.update_attribute(:status, 'rechazada')
    @table = Table.find_by reservation_id: @reservation.id
    @table.update_attribute(:disponibilidad, true)
    @table.update_attribute(:reservation_id, '')
    if @reservation.save
      redirect_to reservation_path(@reservation)
      @usuario_mail = User.find(@reservation.user_id)
      ReservationMailer.with(reservation: @reservation).reservation_rejected(@usuario_mail.email).deliver_now!
    else
      redirect_to reservations_path
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:nombre_usuario, :fecha_reserva, :hora_inicio, :hora_termino, :status, :people, :ubicacion, :fumador)
  end
end
