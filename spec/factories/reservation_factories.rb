# frozen_string_literal: true

require 'factory_bot'
FactoryBot.define do
  factory :reservation do
    nombre_usuario { 'juanjulilola' }
    fecha_reserva { '04-11-2022' }
    hora_inicio { '19:00' }
    hora_termino { '21:00' }
  end
end
