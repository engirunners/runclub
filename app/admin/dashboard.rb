# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        panel 'Недавние старты' do
          ul do
            Event.order(date: :desc).limit(10).map do |event|
              li link_to("#{l event.date} - #{event.name}", admin_event_commands_path(event))
            end
          end
        end
      end
    end
  end
end
