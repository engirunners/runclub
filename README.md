# Engirunners club site

* Ruby version 3.2.2

* System dependencies

  - `libvips`

## Deployment instructions

See https://gorails.com/deploy/ubuntu/22.04

### Server configuration

```
sudo apt-get update
sudo apt-get -y install postgresql postgresql-contrib libpq-dev libffi-dev libyaml-dev libvips-dev nodejs yarn rbenv gnupg nginx
adduser deploy
adduser deploy sudo
sudo timedatectl set-timezone Europe/Moscow
# Install rbenv
rbenv init
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
rbenv install 3.2.2
rbenv global 3.2.2
git clone https://github.com/rbenv/rbenv-vars.git "$(rbenv root)"/plugins/rbenv-vars
gem install bundler
sudo mkdir -p /var/www
sudo chown deploy /var/www
ssh-keygen -t ed25519 -C "your_email@example.com"
# Then add new SSH key to GitHub account
# Set database:
sudo su - postgres
psql -U postgres
\password
# input password
create database engirunners_prod;
```

### localhost:
```
ssh-copy-id root@1.2.3.4
ssh-copy-id deploy@1.2.3.4
```

### Setup server services
```
cap production puma:install
cap production puma:enable

cap production nginx:site:add
cap production nginx:site:enable

# disable PasswordAuthentication -> no
sudo vim /etc/ssh/sshd_config
sudo  systemctl restart ssh
```
