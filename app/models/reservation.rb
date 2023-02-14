# frozen_string_literal: true

# Model for reservation
class Reservation < ApplicationRecord
  validates :nombre_usuario, :fecha_reserva, :hora_inicio, :hora_termino, presence: true

  enum status: %i[pendiente aprobada rechazada]
  belongs_to :user
  belongs_to :restaurant

  validate :fecha_reserva_cannot_be_in_the_past
  validate :hora_termino_despues_hora_inicio

  def fecha_reserva_cannot_be_in_the_past
    #errors.add(:fecha_reserva, 'no puede ser anterior al día actual') if fecha_reserva.present? && fecha_reserva < Date.today
    flash[:error] = :fecha_reserva, 'no puede ser anterior al día actual' if fecha_reserva.present? && fecha_reserva < Date.today
  end

  def hora_termino_despues_hora_inicio
    errors.add(:hora_termino, 'debe ser después de la hora de inicio.') if hora_termino <= hora_inicio
  end

  belongs_to :user
  belongs_to :restaurant
  has_one :table, dependent: :nullify
end
