# frozen_string_literal: true

ActiveAdmin.register Event do
  permit_params :date, :name, :description

  config.sort_order = 'date_desc'

  filter :athlete
  filter :date
  filter :name
  filter :description

  index download_links: [:scv] do
    selectable_column
    column :date
    column :name
    column(:description) { |e| sanitized_text e.description&.truncate(200) }
    actions
  end

  show do
    attributes_table do
      row :date
      row :name
      row(:description) { |e| sanitized_text e.description }
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :date, start_year: 2015, end_year: Date.current.year
      f.input :name
      f.input :description, as: :quill_editor,
                            input_html: {
                              data: {
                                options: {
                                  modules: {
                                    toolbar: [
                                      %w[bold italic strike],
                                      %w[blockquote code-block],
                                      [{ list: 'ordered' }, { list: 'bullet' }, { list: 'check' }],
                                      [{ indent: '-1' }, { indent: '+1' }],
                                      [{ direction: 'rtl' }],
                                      ['link'],
                                      ['clean']
                                    ],
                                  },
                                  placeholder: 'Какое же ...',
                                  theme: 'snow',
                                },
                              },
                            }
    end
    f.actions
  end

  action_item :results, only: %i[show edit] do
    link_to 'Результаты', admin_event_results_path(resource)
  end
end
