# frozen_string_literal: true

class Review < ApplicationRecord
  validates :title, :body, :rating, presence: true
  validates :rating, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 0 }

  belongs_to :user
  belongs_to :restaurant
end
