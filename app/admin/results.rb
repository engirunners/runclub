# frozen_string_literal: true

ActiveAdmin.register Result do
  belongs_to :event
  actions :all, except: [:show]

  permit_params :athlete_id, :event_id, :total_time, :stage, :distance

  config.filters = false
  config.sort_order = 'stage_asc'

  index download_links: [:scv] do
    column :stage
    column :distance
    column :athlete
    column(:total_time) { |r| human_result_time r.total_time }
    column(:pace) { |r| human_result_pace r.total_time, r.distance }
    actions
  end

  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :stage
      f.input :distance
      f.input :athlete, as: :searchable_select
      f.input :total_time, as: :time_select, include_seconds: true, ignore_date: true, include_blank: false
    end
    f.actions
  end
end
