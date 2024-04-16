# frozen_string_literal: true

ActiveAdmin.register Achievement do
  actions :all, except: [:show]

  permit_params :title, :description

  filter :title
  filter :description

  index download_links: false do
    column :title
    column(:description, sortable: false) { |a| sanitized_text a.description }
    actions dropdown: true
  end

  show do
    attributes_table do
      row :title
      row(:description) { |a| sanitized_text a.description }
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :title
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
                                  placeholder: 'Достижение невероятных результатов...',
                                  theme: 'snow',
                                },
                              },
                            }
    end
    f.actions
  end
end
