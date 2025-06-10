# frozen_string_literal: true

ActiveAdmin.register Result do
  belongs_to :command

  includes :athlete

  actions :all, except: [:show]

  permit_params :athlete_id, :command_id, :total_time, :stage, :distance, :fractional_second, :kind

  config.sort_order = 'stage_asc'

  breadcrumb do
    [
      link_to('Панель управления', admin_root_path),
      link_to('Эстафеты', admin_events_path),
    ]
  end

  index title: -> { "#{@command.event.name} - команда \"#{@command.name || @command.id}\"" } do
    column :stage
    column(:kind) { |r| human_result_kind r }
    column(:distance) { |r| number_with_delimiter r.distance }
    column :athlete
    column(:total_time) { |r| human_result_time r }
    column(:pace) { |r| human_result_pace r }
    actions dropdown: true
  end

  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :stage, as: :select, collection: 1..100, include_blank: false
      f.input :kind, include_blank: false
      f.input :distance, input_html: { inputmode: 'numeric' }
      f.input :athlete, as: :searchable_select
      f.input :total_time, as: :time_select, include_seconds: true, ignore_date: true, include_blank: false
      f.input :fractional_second, as: :select, collection: 0..99
    end
    f.actions
  end
end
