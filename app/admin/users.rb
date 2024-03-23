# frozen_string_literal: true

ActiveAdmin.register User do
  actions :all, except: [:show]
  permit_params :password, :password_confirmation

  config.filters = false

  index download_links: false do
    selectable_column
    column :email
    actions
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
