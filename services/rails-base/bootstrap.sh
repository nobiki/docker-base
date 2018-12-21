#!/bin/bash

export RAILS_ENV=development

if [ ! -e /bootstrap.lock ]; then

  if [ ! -e /web/app ]; then

    sudo chown 1000:1000 /web

    # Install Rails app with Webpacker
    rails new /web/ --webpack=vue --skip-bundle
    echo "gem 'dotenv-rails'" >> Gemfile
    #echo "gem 'webpacker', github: 'rails/webpacker'" >> Gemfile

    bundle install --jobs=4 --path vendor/bundle/

    if [ ! -e /web/bin/webpack ]; then
      # Install Webpacker
      rails webpacker:install

      # Install Vue
      rails webpacker:install:vue
      tee -a /web/config/initializers/content_security_policy.rb << 'EOF'
Rails.application.config.content_security_policy do |policy|
  if Rails.env.development?
    policy.script_src :self, :https, :unsafe_eval
  else
    policy.script_src :self, :https
  end
end
EOF
      # Hello Vue
      rails g controller Top index
      echo "<%= javascript_pack_tag 'hello_vue' %>" >> app/views/top/index.html.erb

      # Hot Module Reload Enable
      sed -ri "s/hmr: false/hmr: true/" config/webpacker.yml
    fi

    # Install Node modules
    yarn install
  else

    bundle install --jobs=4 --path vendor/bundle/
    yarn install

    # rails db:create
    # rails db:migrate
  fi

  sudo touch /bootstrap.lock
fi

echo "----- version info -----"
echo "bundle: "`bundle --version`
echo "ruby: "`ruby -v`
echo "rails: "`rails -v`
echo "node: "`node -v`
echo "yarn: "`yarn -v`
echo "webpack: "`bin/webpack -v`
echo "------------------------"

rm -f /web/tmp/pids/server.pid
bundle exec rails s -p 3000 -b '0.0.0.0'
