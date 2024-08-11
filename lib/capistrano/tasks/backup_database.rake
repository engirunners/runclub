# frozen_string_literal: true

namespace :db do
  desc 'Create and download database backup'
  task :backup do
    on roles(:all) do
      backup_file = 'tmp/backup.dump'
      server_backup_file = File.join(shared_path, backup_file)
      execute "pg_dump -U #{ENV.fetch('DEPLOY_USER', 'postgres')} -Fc -Z9 engirunners_prod > #{server_backup_file}"
      download! server_backup_file, backup_file
    end
  end
end
