# rails_env = new_resource.environment["RAILS_ENV"]
#
# Chef::Log.info("Precompiling assets for RAILS_ENV=#{rails_env}...")
#
# execute "rake assets:precompile" do
#   cwd release_path
#   command "bundle exec rake assets:precompile 2>&1"
#   environment "RAILS_ENV" => rails_env
# end
