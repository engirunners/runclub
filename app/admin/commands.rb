# frozen_string_literal: true

ActiveAdmin.register Command do
  belongs_to :event
  actions :all, except: [:show]

  permit_params(
    :event_id, :name, :total_time, :category, :form, :position, :position_abs, :places_category, :places_overall,
  )

  config.sort_order = 'position_asc'

  index do
    column :name
    column(:total_time) { |c| human_result_time c.total_time }
    column(:category) { |c| human_command_category(c) }
    column(:stages) { |c| c.results.count }
    column :form, sortable: false
    column :position_abs
    column :places_overall
    column :position
    column :places_category
    actions dropdown: true do |command|
      item 'Результаты', admin_command_results_path(command)
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :total_time, as: :time_select, include_seconds: true, ignore_date: true, include_blank: false
      f.input :category, include_blank: false
      f.input :form
      f.input :position_abs
      f.input :places_overall
      f.input :position
      f.input :places_category
    end
    f.actions
  end

  action_item :results, only: %i[show edit] do
    link_to 'Результаты', admin_command_results_path(resource)
  end
end
