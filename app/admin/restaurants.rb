# frozen_string_literal: true

ActiveAdmin.register Restaurant do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :address, :commune, :open, :close, :rating, :food, :logo
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :address, :commune, :open, :close, :rating, :food, :logo]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
