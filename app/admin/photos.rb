# frozen_string_literal: true

ActiveAdmin.register Photo do
  includes image_attachment: :blob

  permit_params :image

  actions :all, except: :show

  config.filters = false

  index download_links: false do
    selectable_column
    id_column
    column(:image) { |p| image_tag p.image }
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end
end
