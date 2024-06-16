# frozen_string_literal: true

ActiveAdmin.register Event do
  actions :all, except: [:show]

  permit_params :date, :location, :name

  config.sort_order = 'date_desc'

  index do
    column :date
    column(:name) { |e| link_to e.name, admin_event_commands_path(e) }
    column(:commands_count) { |e| e.commands.size }
    column :location, sortable: false

    actions dropdown: true
  end

  form do |f|
    f.inputs do
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
