require 'rspec'
require 'vcr'

require_relative '../lib/healthgraph'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock # or :fakeweb
  c.configure_rspec_metadata!
  c.default_cassette_options = { :record => :new_episodes }
  c.filter_sensitive_data('<ACCESS_TOKEN>') { ENV['HEALTHGRAPH_TOKEN'] }
end
