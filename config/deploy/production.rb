set :user,           "deploy"

set :deploy_to,      "/home/deploy/#{application}"
set :rails_env,      "production"
set :bundle_without, [:development, :test, :staging]

# role :app, "#{domain}"
# role :web, "#{domain}"
# role :db,  "#{domain}", :primary => true
