# frozen_string_literal: true

require 'rails_helper'
require 'support/auth_helper'
include AuthHelper

RSpec.describe Reservation, type: :request do
  before(:each) do
    login_user
  end

  before(:all) do
    @reservation = create(:reservation)
    @reservation.save
  end

  describe 'POST /reservations' do
    it 'should create a reservation' do
      expect do
        post reservations_path, params: {
          reservation: {
            nombre_usuario: @reservation.nombre_usuario,
            fecha_reserva: @reservation.fecha_reserva,
            hora_inicio: @reservation.hora_inicio,
            hora_termino: @reservation.hora_termino
          }
        }
      end.to change(Reservation, :count).by(1)
    end

    it 'should not create a reservation with invalid data' do
      expect do
        post reservations_path, params: {
          reservation: {
            nombre_usuario: '',
            fecha_reserva: @reservation.fecha_reserva,
            hora_inicio: @reservation.hora_inicio,
            hora_termino: @reservation.hora_termino
          }
        }
      end.to change(Reservation, :count).by(0)
    end
  end

  describe 'PATCH /reservations/:id' do
    it 'should update a reservation\'s fecha_reserva' do
      patch reservation_path(@reservation), params: {
        reservation: {
          nombre_usuario: @reservation.nombre_usuario,
          fecha_reserva: '03-10-2022',
          hora_inicio: @reservation.hora_inicio,
          hora_termino: @reservation.hora_termino
        }
      }
      expect(Reservation.find(@reservation.id).fecha_reserva).to eq('03-10-2022')
    end

    it 'should not update a reservation with invalid data' do
      patch reservation_path(@reservation), params: {
        reservation: {
          nombre_usuario: '',
          fecha_reserva: @reservation.fecha_reserva,
          hora_inicio: @reservation.hora_inicio,
          hora_termino: @reservation.hora_termino
        }
      }
      expect(Reservation.find(@reservation.id).nombre_usuario).to eq(@reservation.nombre_usuario)
    end
  end

  describe 'DELETE /reservations/:id' do
    it 'should delete a reservation' do
      expect do
        delete reservation_path(@reservation)
      end.to change(Reservation, :count).by(-1)
    end
  end
end
