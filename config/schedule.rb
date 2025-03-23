set :bundle_command, '~/.rbenv/shims/bundle exec'
set :path, '/var/www/engirunners/current'
set :output, '~/cron.log'
set :chronic_options, hours24: true

every 1.week do
  rake 'active_storage:purge_unattached'
end

every '0 2 25 * *' do
  command '$HOME/.monb.sh engirunners@yandex.ru'
end

every '5 2 25 * *' do
  command '$HOME/backup_storage.sh'
end
