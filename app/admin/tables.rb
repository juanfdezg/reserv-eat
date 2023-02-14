# frozen_string_literal: true

ActiveAdmin.register Table do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :nombre_restaurant, :capacidad, :ubicacion, :disponibilidad, :fumador, :restaurant_id, :reservation_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:nombre_restaurant, :capacidad, :ubicacion, :disponibilidad, :fumador, :restaurant_id, :reservation_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
