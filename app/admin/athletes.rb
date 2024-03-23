# frozen_string_literal: true

ActiveAdmin.register Athlete do
  permit_params(
    :image, :first_name, :last_name, :birth_date, :phone, :telegram_name, :email, :gender, :description, :location,
  )

  filter :first_name
  filter :last_name
  filter :birth_date
  filter :gender, as: :select, collection: Athlete.genders

  index download_links: [:scv] do
    selectable_column
    column :first_name
    column :last_name
    column :birth_date
    column :gender
    column :phone
    column(:telegram_name) { |a| telegram_link a }
    column :email
    actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :birth_date
      row :gender
      row :phone
      row :email
      row(:telegram_name) { |a| telegram_link a }
      row(:description) { |a| sanitized_text a.description }
      row :location
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :image, as: :file
      f.input :first_name
      f.input :last_name
      f.input :birth_date, start_year: 80.years.ago.year, end_year: 16.years.ago.year
      f.input :gender
      f.input :phone
      f.input :telegram_name
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
                                  placeholder: 'Какой же крутой у нас одноклубник...',
                                  theme: 'snow',
                                },
                              },
                            }
      f.input :location
      f.input :email
    end
    f.actions
  end
end
