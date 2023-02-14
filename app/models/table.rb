# frozen_string_literal: true

class Table < ApplicationRecord
  validates :nombre_restaurant, :capacidad, :ubicacion, :disponibilidad, presence: true
  validates :capacidad, numericality: { only_integer: true, greater_than: 0 }
  attribute :disponibilidad, :boolean, default: true

  has_one :reservation
  belongs_to :restaurant
end
