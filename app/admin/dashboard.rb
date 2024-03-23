# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        panel 'Недавние старты' do
          ul do
            Event.order(date: :desc).limit(5).map do |event|
              li link_to(event.name, admin_event_path(event))
            end
          end
        end
      end

      column do
        panel 'Инфа' do
          para 'Привет.'
        end
      end
    end

    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      span class: 'blank_slate' do
        span 'Страничка управления сайтом'
        small 'Тут добавить какую-то инфу'
      end
    end
  end
end
