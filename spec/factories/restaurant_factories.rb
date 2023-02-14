# frozen_string_literal: true

require 'factory_bot'
FactoryBot.define do
  factory :restaurant do
    name { 'Burritos de Lola' }
    location { 'Av. Algarrobo 1313' }
    open { '12:00' }
    close { '17:00' }
    score { 4.5 }
    food { 'Burritos' }
    logo { 'https://static.wikia.nocookie.net/hunger_games_simulator/images/9/9a/Therock.png/revision/latest?cb=20210126112836' }
  end
end
