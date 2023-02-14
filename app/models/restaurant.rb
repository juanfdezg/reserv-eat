# frozen_string_literal: true

class Restaurant < ApplicationRecord
  validates :name, :address, :commune, :open, :close, :rating, :food, :logo, :description, presence: true
  validates :rating, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 0 }
  attribute :rating, :integer, default: 0
  has_one_attached :logo
  has_many :reviews, dependent: :destroy

  scope :filter_by_commune, ->(commune) { where commune: commune }
  scope :filter_by_food, ->(food) { where food: food }
  scope :filter_by_rating, ->(rating) { where('rating >= ?', rating) }
  has_many :reservations, dependent: :destroy
  has_many :tables, dependent: :destroy
  belongs_to :user
end
