# frozen_string_literal: true

ActiveAdmin.register Partner do
  includes logo_attachment: :blob

  actions :all, except: :show

  permit_params :name, :link, :logo

  index do
    column(:logo) { |p| image_tag p.logo.variant(:thumb), style: 'max-height: 120px;' if p.logo.attached? }
    column :name
    column :link, sortable: false
    actions dropdown: true
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :link
      f.input :logo, as: :file
    end
    f.actions
  end
end
