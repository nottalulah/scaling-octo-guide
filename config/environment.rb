RAILS_GEM_VERSION = "2.3.4"

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Skip frameworks you're not going to use
  # config.frameworks -= [:action_web_service]

  # Add additional load paths for your own custom dirs
  config.load_paths += ["#{RAILS_ROOT}/app/presenters"]

  # Force all environments to use the same logger level
  # (by default production uses :info, the others :debug
  config.log_level = :info

  # Enable page/fragment caching by setting a file-based store
  # (remember to create the caching directory and make it readable to the application)
  # config.action_controller.fragment_cache_store = :file_store, "#{RAILS_ROOT}/cache"

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector

  # Make Active Record use UTC-base instead of local time
  # config.active_record.default_timezone = :utc

  # Use Active Record's schema dumper instead of SQL when creating the test database
  # (enables use of different database adapters for development and test environments)
  config.active_record.schema_format = :sql
  
  config.gem "diff-lcs", :lib => "diff/lcs/array"
  config.gem "html5"
  config.gem "memcache-client", :lib => "memcache"
  config.gem "aws-s3", :lib => "aws/s3"
  config.gem "json"
  config.gem "sys-cpu", :lib => "sys/cpu"
	config.gem "mechanize"
end
