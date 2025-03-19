# frozen_string_literal: true

ActiveAdmin.register Event do
  includes image_attachment: :blob

  actions :all, except: [:show]

  permit_params :date, :location, :name, :image

  config.sort_order = 'date_desc'

  index do
    column(:image) { |e| image_tag e.image.variant(:thumb), width: 100 if e.image.attached? }
    column :date
    column(:name) { |e| link_to e.name, admin_event_commands_path(e) }
    column(:commands_count) { |e| e.commands.size }
    column :location, sortable: false

    actions dropdown: true
  end

  form do |f|
    f.inputs do
      f.input :image, as: :file, hint: 'Размер фото должен быть не менее 1090x774px'
      f.input :date, start_year: 2015, end_year: Date.current.year
      f.input :name
      f.input :location
    end
    f.actions
  end

  action_item :commands, only: :edit do
    link_to 'Команды', admin_event_commands_path(resource)
  end
end
