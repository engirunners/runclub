# frozen_string_literal: true

ActiveAdmin.register Command do
  belongs_to :event
  actions :all, except: [:show]

  permit_params(
    :event_id, :name, :category, :form, :position, :position_abs, :places_category, :places_overall,
    :total_time, :fractional_second, :kind,
  )

  config.sort_order = 'position_asc'

  index do
    column :kind
    column(:name) { |c| link_to c.name, admin_command_results_path(c) }
    column(:total_time) { |c| human_result_time c }
    column(:category) { |c| human_command_category c }
    column(:stages) { |c| c.results.size }
    column :form, sortable: false
    column :position_abs
    column :places_overall
    column :position
    column :places_category
    actions dropdown: true
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :total_time, as: :time_select, include_seconds: true, ignore_date: true, include_blank: false
      f.input :fractional_second, as: :select, collection: 0..99
      f.input :kind, include_blank: false
      f.input :category, include_blank: false
      f.input :form
      f.input :position_abs, input_html: { inputmode: 'numeric' }
      f.input :places_overall, input_html: { inputmode: 'numeric' }
      f.input :position, input_html: { inputmode: 'numeric' }
      f.input :places_category, input_html: { inputmode: 'numeric' }
    end
    f.actions
  end

  action_item :results, only: %i[show edit] do
    link_to 'Результаты', admin_command_results_path(resource)
  end
end
