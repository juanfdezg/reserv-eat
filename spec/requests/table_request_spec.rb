# frozen_string_literal: true

require 'rails_helper'
require 'support/auth_helper'
include AuthHelper

RSpec.describe Table, type: :request do
  before(:each) do
    login_user
  end

  before(:all) do
    @table = create(:table)
    @table.save
  end

  describe 'POST /tables' do
    it 'should create a table' do
      expect do
        post tables_path, params: {
          table: {
            nombre_restaurant: @table.nombre_restaurant,
            capacidad: @table.capacidad,
            ubicacion: @table.ubicacion,
            disponibilidad: @table.disponibilidad,
            fumador: @table.fumador
          }
        }
      end.to change(Table, :count).by(1)
    end

    it 'should not create a table with invalid data' do
      expect do
        post tables_path, params: {
          table: {
            nombre_restaurant: @table.nombre_restaurant,
            capacidad: -1,
            ubicacion: @table.ubicacion,
            disponibilidad: @table.disponibilidad,
            fumador: @table.fumador
          }
        }
      end.to change(Table, :count).by(0)
    end
  end

  describe 'PATCH /tables/:id' do
    it 'should update a table\'s ubicacion' do
      patch table_path(@table), params: {
        table: {
          nombre_restaurant: @table.nombre_restaurant,
          capacidad: @table.capacidad,
          ubicacion: 'Av. Pedro de Valdivia 3416',
          disponibilidad: @table.disponibilidad,
          fumador: @table.fumador
        }
      }
      expect(Table.find(@table.id).ubicacion).to eq('Av. Pedro de Valdivia 3416')
    end

    it 'should not update a table with invalid data' do
      patch table_path(@table), params: {
        table: {
          nombre_restaurant: '',
          capacidad: @table.capacidad,
          ubicacion: @table.ubicacion,
          disponibilidad: @table.disponibilidad,
          fumador: @table.fumador
        }
      }
      expect(Table.find(@table.id).nombre_restaurant).to eq(@table.nombre_restaurant)
    end
  end

  describe 'DELETE /tables/:id' do
    it 'should delete a table' do
      expect do
        delete table_path(@table)
      end.to change(Table, :count).by(-1)
    end
  end
end
