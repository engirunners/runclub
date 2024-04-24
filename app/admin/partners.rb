# frozen_string_literal: true

ActiveAdmin.register Partner do
  includes logo_attachment: :blob

  actions :all, except: :show

  permit_params :name, :link, :logo

  index download_links: false do
    column(:logo) { |p| image_tag p.logo.variant(:thumb) if p.logo.attached? }
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
