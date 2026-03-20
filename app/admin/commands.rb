# frozen_string_literal: true

ActiveAdmin.register Command do
  includes image_attachment: :blob
  belongs_to :event
  actions :all, except: [:show]

  permit_params(
    :event_id, :image, :name, :category, :form, :position, :position_abs, :places_category, :places_overall,
    :total_time, :fractional_second, :status, :note
  )

  config.sort_order = 'position_asc'

  index do
    column(:image) { |e| image_tag e.image.variant(:thumb), width: 100 if e.image.attached? }
    column(:name) { |c| link_to c.name, admin_command_results_path(c) }
    column(:total_time) { |c| human_result_time c }
    column(:category) { |c| human_command_category c }
    column(:stages) { |c| c.results.size }
    column :form, sortable: false
    column :position_abs
    column :places_overall
    column :position
    column :places_category
    column(:status) { |c| c.status.upcase }
    column(:note) { |c| c.note.present? }
    actions dropdown: true
  end

  form do |f|
    f.inputs do
      f.input :image, as: :file, hint: 'Размер фото должен быть не менее 1090x774px'
      f.input :name
      f.input :total_time, as: :time_select, include_seconds: true, ignore_date: true, include_blank: false
      f.input :fractional_second, as: :select, collection: 0..99
      f.input :category, include_blank: false
      f.input :form
      f.input :position_abs, input_html: { inputmode: 'numeric' }
      f.input :places_overall, input_html: { inputmode: 'numeric' }
      f.input :position, input_html: { inputmode: 'numeric' }
      f.input :places_category, input_html: { inputmode: 'numeric' }
      f.input :status, include_blank: false
      f.input :note
    end
    f.actions
  end

  action_item :results, only: %i[show edit] do
    link_to 'Результаты', admin_command_results_path(resource)
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
