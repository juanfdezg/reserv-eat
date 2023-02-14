# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    title { 'MyString' }
    body { 'MyString' }
    rating { 1.5 }
    user { nil }
    restaurant { nil }
  end
end
