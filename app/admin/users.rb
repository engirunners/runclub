# frozen_string_literal: true

ActiveAdmin.register User do
  actions :all, except: [:show]
  permit_params :email, :password, :password_confirmation

  index do
    column :email
    column :created_at
    actions dropdown: true
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation, required: true
    end
    f.actions
  end
end
