# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Table, type: :model do
  describe '#factory' do
    it 'is valid' do
      expect(build(:restaurant)).to be_valid
    end
  end
end
