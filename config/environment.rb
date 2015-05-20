# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load environment variables
variables = File.join(Rails.root, "config", "variables.rb")
load(variables) if File.exists?(variables)

# Initialize the Rails application.
Rails.application.initialize!
