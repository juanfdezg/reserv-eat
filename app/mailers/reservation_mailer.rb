# frozen_string_literal: true

# ReservationMailer
class ReservationMailer < ApplicationMailer
  def new_reservation_email(mail)
    @mail = mail
    @reservation = params[:reservation]
    mail(to: @mail, subject: 'Reserva exitosa en Reserv-eat.')
  end

  def reservation_rejected(mail)
    @mail = mail
    @reservation = params[:reservation]
    mail(to: @mail, subject: 'Reserva rechazada en Reserv-eat.')
  end
end
