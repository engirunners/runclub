# frozen_string_literal: true

ActiveAdmin.register Athlete do
  includes image_attachment: :blob

  permit_params(
    :nickname, :image, :first_name, :last_name, :birth_date, :hide_birth_date, :debut_date, :exit_date, :description,
    :parkrun_link, :gender, :fiveverst_link, :s95_link, :probeg_link, :strava_link, :telegram_link, :instagram_link,
  )

  config.paginate = false
  config.sort_order = 'last_name_asc'

  index row_class: ->(a) { [('ex' if a.exit_date.present?), ('hidden-birth-date' if a.hide_birth_date)].compact } do
    column(:image) { |a| image_tag a.image.variant(:thumb) if a.image.attached? }
    column :nickname
    column :name
    column(:gender) { |a| human_athlete_gender a }
    column :birth_date
    column :debut_date
    column(:description) { |a| a.description.present? }
    column(:fiveverst_link, sortable: false) { |a| a.fiveverst_link.present? }
    column(:s95_link, sortable: false) { |a| a.s95_link.present? }
    column(:probeg_link, sortable: false) { |a| a.probeg_link.present? }
    column(:strava_link, sortable: false) { |a| a.strava_link.present? }
    column(:parkrun_link, sortable: false) { |a| a.parkrun_link.present? }
    column(:telegram_link, sortable: false) { |a| a.telegram_link.present? }
    column(:instagram_link, sortable: false) { |a| a.instagram_link.present? }
    column :exit_date

    actions dropdown: true
  end

  show do
    attributes_table do
      row :nickname
      row :first_name
      row :last_name
      row :birth_date
      row(:gender) { |a| human_athlete_gender a }
      row :debut_date
      row(:description) { |a| sanitized_text a.description }
      row :fiveverst_link
      row :s95_link
      row :probeg_link
      row :strava_link
      row :parkrun_link
      row :telegram_link
      row :instagram_link
      row :exit_date
      row(:image) { |a| image_tag a.image.variant(:web) if a.image.attached? }
    end
  end

  form do |f|
    f.inputs 'Личные данные' do
      f.input :image, as: :file, hint: 'Размер фото должен быть не менее 800x800px'
      f.input :nickname, required: true
      f.input :first_name, as: :string
      f.input :last_name, as: :string
      f.input :hide_birth_date
      f.input :birth_date, start_year: 80.years.ago.year, end_year: 7.years.ago.year
      f.input :gender, include_blank: false
      f.input :debut_date, start_year: 2015, end_year: Date.current.year
      f.input :description, as: :quill_editor,
                            input_html: {
                              data: {
                                options: {
                                  modules: {
                                    toolbar: [
                                      %w[bold italic strike],
                                      %w[blockquote code-block],
                                      [{ list: 'ordered' }, { list: 'bullet' }],
                                      [{ indent: '-1' }, { indent: '+1' }],
                                      ['link'],
                                      ['clean'],
                                    ],
                                  },
                                  placeholder: 'Личники, достижения и т.п.',
                                  theme: 'snow',
                                },
                              },
                            }
    end
    f.inputs 'Ссылки на профили спортсмена' do
      f.input :fiveverst_link
      f.input :s95_link
      f.input :probeg_link
      f.input :strava_link
      f.input :parkrun_link
      f.input :telegram_link
      f.input :instagram_link
    end
    f.inputs 'Заполняется в случае выхода спортсмена из клуба' do
      f.input :exit_date, start_year: 2015, end_year: Date.current.year
    end
    f.actions
  end

  action_item :destroy_image, only: %i[show edit] do
    if resource.image.attached?
      link_to(
        'Удалить фото',
        destroy_image_admin_athlete_path(resource),
        data: { confirm: 'Удалить фото спортсмена?' },
        method: :delete,
      )
    end
  end

  member_action :destroy_image, method: :delete do
    resource.image.purge
    redirect_to admin_athlete_path(resource), notice: t('.destroy_image')
  end
end
