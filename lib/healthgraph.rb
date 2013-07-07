require "healthgraph/version"

require "healthgraph/user"
require "healthgraph/profile"
require "healthgraph/settings"
require "healthgraph/records"
require "healthgraph/fitness_activities"

module Healthgraph

  def self.connection
    conn ||= Faraday.new(:url => 'https://api.runkeeper.com') do |faraday|
      faraday.request  :url_encoded
      faraday.adapter  Faraday.default_adapter
    end
  end

end
