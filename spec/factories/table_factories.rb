# frozen_string_literal: true

require 'factory_bot'
FactoryBot.define do
  factory :table do
    nombre_restaurant { 'McBurger' }
    capacidad { 10 }
    ubicacion { 'Av. Los Leones 1340' }
    disponibilidad { 10 }
    fumador { 'SI' }
  end
end
