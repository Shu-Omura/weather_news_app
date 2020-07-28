require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "#{::Rails.root}/spec/cassettes"
  config.hook_into :webmock
  config.ignore_localhost = true
  config.configure_rspec_metadata!
  config.filter_sensitive_data('<URL>') { Rails.application.credentials.open_weather[:uri] }
  config.filter_sensitive_data('<API_KEY>') { Rails.application.credentials.open_weather[:appid] }
end
