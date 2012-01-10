set :user,           "stage"

set :deploy_to,      "/home/stage/#{application}"
set :rails_env,      "staging"
set :bundle_without, [:development, :test, :production]

# role :app, "#{domain}"
# role :web, "#{domain}"
# role :db,  "#{domain}", :primary => true
