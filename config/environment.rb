# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Datadog.configure { |c| c.analytics_enabled = true }