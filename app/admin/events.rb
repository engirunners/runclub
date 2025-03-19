# frozen_string_literal: true

ActiveAdmin.register Event do
  includes image_attachment: :blob

  actions :all, except: [:show]

  permit_params :date, :location, :name, :image, :hidden

  config.sort_order = 'date_desc'

  index do
    column(:image) { |e| image_tag e.image.variant(:thumb), width: 100 if e.image.attached? }
    column :date
    column(:name) { |e| link_to e.name, admin_event_commands_path(e) }
    column(:commands_count) { |e| e.commands.size }
    column :location, sortable: false
    column :hidden

    actions dropdown: true
  end

  form do |f|
    f.inputs do
      f.input :image, as: :file, hint: 'Размер фото должен быть не менее 1090x774px'
      f.input :date, start_year: 2015, end_year: Date.current.year
      f.input :name
      f.input :location
      f.input :hidden
    end
    f.actions
  end

  action_item :destroy_image, only: :edit do
    if resource.image.attached?
      link_to(
        'Удалить фото',
        destroy_image_admin_event_path(resource),
        data: { confirm: "Удалить фото эстафеты #{resource.name}?" },
        method: :delete,
      )
    end
  end

  action_item :commands, only: :edit do
    link_to 'Команды', admin_event_commands_path(resource)
  end

  member_action :destroy_image, method: :delete do
    resource.image.purge
    redirect_to edit_admin_event_path(resource), notice: t('.destroy_image')
  end
end
