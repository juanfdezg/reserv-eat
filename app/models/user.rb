# frozen_string_literal: true

# Model for user
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_messageable

  def mailboxer_email(_object)
    nil
  end

  validates :name, presence: true
  enum role: %i[user moderator]
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :restaurants, dependent: :destroy
end
