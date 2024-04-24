# frozen_string_literal: true

ActiveAdmin.register Event do
  actions :all, except: [:show]

  permit_params(
    :date, :name, :location, :total_time, :category, :form,
    :position, :position_abs, :places_category, :places_overall,
  )

  config.sort_order = 'date_desc'

  index download_links: [:scv] do
    column :date
    column :name
    column :location, sortable: false
    column(:total_time) { |e| human_result_time e.total_time }
    column(:category) { |e| human_event_category(e) }
    column(:stages) { |e| e.results.count }
    column :form, sortable: false
    column :position_abs
    column :places_overall
    column :position
    column :places_category
    actions dropdown: true do |event|
      item 'Результаты', admin_event_results_path(event)
    end
  end

  form do |f|
    f.inputs do
      f.input :date, start_year: 2015, end_year: Date.current.year
      f.input :name
      f.input :location
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
    link_to 'Результаты', admin_event_results_path(resource)
  end
end
