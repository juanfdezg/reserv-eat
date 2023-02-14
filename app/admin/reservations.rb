# frozen_string_literal: true

ActiveAdmin.register Reservation do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :nombre_usuario, :hora_inicio, :hora_termino, :user_id, :fecha_reserva, :restaurant_id, :status, :people
  #
  # or
  #
  # permit_params do
  #   permitted = [:nombre_usuario, :hora_inicio, :hora_termino, :user_id, :fecha_reserva, :restaurant_id, :status, :people]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
