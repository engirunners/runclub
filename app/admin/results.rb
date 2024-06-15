# frozen_string_literal: true

ActiveAdmin.register Result do
  belongs_to :command
  actions :all, except: [:show]

  permit_params :athlete_id, :command_id, :total_time, :stage, :distance

  config.sort_order = 'stage_asc'

  breadcrumb do
    [
      link_to('Панель управления', admin_root_path),
      link_to('Эстафеты', admin_events_path),
    ]
  end

  index title: -> { "#{@command.event.name} - команда '#{@command.name || @command.id}'" } do
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
