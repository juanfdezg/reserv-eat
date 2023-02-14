# frozen_string_literal: true

ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |form|
    form.inputs do
      form.input :email
      form.input :password
      form.input :password_confirmation
    end
    form.actions
  end
end
