# frozen_string_literal: true

require 'factory_bot'
FactoryBot.define do
  factory :user do
    name { 'Pedro Piedra' }
    password { 'hola123' }
    email { 'pedropiedra@gmail.com' }
  end
end
