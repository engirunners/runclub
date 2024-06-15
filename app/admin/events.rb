# frozen_string_literal: true

ActiveAdmin.register Event do
  actions :all, except: [:show]

  permit_params :date, :location, :name

  config.sort_order = 'date_desc'

  index do
    column :date
    column :name
    column :location, sortable: false

    actions dropdown: true do |event|
      item 'Команды', admin_event_commands_path(event)
    end
  end

  form do |f|
    f.inputs do
      f.input :date, start_year: 2015, end_year: Date.current.year
      f.input :name
      f.input :location
    end
    f.actions
  end

  action_item :commands, only: %i[show edit] do
    link_to 'Команды', admin_event_commands_path(resource)
  end
end
