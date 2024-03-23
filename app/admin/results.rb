# frozen_string_literal: true

ActiveAdmin.register Result do
  belongs_to :event
  actions :all, except: [:show]

  permit_params :athlete_id, :event_id, :total_time, :personal_best, :position, :distance

  config.sort_order = 'position_asc'

  index download_links: [:scv] do
    selectable_column
    column :distance
    column :position
    column :athlete
    column(:total_time) { |r| human_result_time r.total_time }
    column(:pace) { |r| human_result_pace r.total_time, r.distance }
    column :personal_best
    actions
  end

  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :distance
      f.input :position
      f.input :athlete
      f.input :total_time, as: :time_select, include_seconds: true, ignore_date: true, include_blank: false
      f.input :personal_best
    end
    f.actions
  end
end
