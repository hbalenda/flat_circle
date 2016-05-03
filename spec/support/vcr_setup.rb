require 'vcr'
require 'webmock'

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = 'spec/vcr'
  c.configure_rspec_metadata!
  c.default_cassette_options = { record: :new_episodes }
end
