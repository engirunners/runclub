# frozen_string_literal: true

ActiveAdmin.register Athlete do
  permit_params(
    :nickname, :image, :first_name, :last_name, :birth_date, :debut_date, :exit_date,
    :parkrun_link, :gender, :fiveverst_link, :s95_link, :probeg_link,
  )

  config.paginate = false
  config.sort_order = 'last_name_asc'

  index download_links: [:scv], row_class: ->(a) { 'inactive' if a.exit_date.present? } do
    column(:image) { |a| image_tag a.image.variant(:thumb) if a.image.attached? }
    column :nickname
    column :first_name
    column :last_name
    column :birth_date
    column :debut_date
    column(:gender) { |a| human_athlete_gender a }
    column(:fiveverst_link, sortable: false) { |a| a.fiveverst_link.present? }
    column(:s95_link, sortable: false) { |a| a.s95_link.present? }
    column(:probeg_link, sortable: false) { |a| a.probeg_link.present? }
    column(:parkrun_link, sortable: false) { |a| a.parkrun_link.present? }
    column :exit_date

    actions dropdown: true
  end

  show do
    attributes_table do
      row :nickname
      row :first_name
      row :last_name
      row :birth_date
      row :gender
      row :debut_date
      row :fiveverst_link
      row :s95_link
      row :probeg_link
      row :parkrun_link
      row :exit_date
      row(:image) { |a| image_tag a.image.variant(:web) if a.image.attached? }
    end
  end

  form do |f|
    f.inputs 'Личные данные' do
      f.input :image, as: :file
      f.input :nickname, required: true
      f.input :first_name
      f.input :last_name
      f.input :birth_date, start_year: 80.years.ago.year, end_year: 14.years.ago.year
      f.input :gender, include_blank: false
      f.input :debut_date, start_year: 2015, end_year: Date.current.year
    end
    f.inputs 'Ссылки на профиль спортсмена' do
      f.input :parkrun_link
      f.input :fiveverst_link
      f.input :s95_link
      f.input :probeg_link
    end
    f.inputs 'Заполняется в случае выхода спортсмена из клуба' do
      f.input :exit_date, start_year: 2015, end_year: Date.current.year
    end
    f.actions
  end
end
