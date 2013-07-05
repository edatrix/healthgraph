require 'faraday'
require 'json'

module Healthgraph
  class User
    attr_reader :access_token, :profile_url

    def initialize(token)
      @access_token = token
      get
    end

    def get
      res = connection.get '/user', {
          access_token: @access_token
      }
      res = JSON.parse(res.body)
      puts res
      set_urls(res)
    end

    protected
      def connection
        #TODO: research consistent prefix and default params to keep it DRY
        conn ||= Faraday.new(:url => 'https://api.runkeeper.com') do |faraday|
          faraday.request  :url_encoded             # form-encode POST params
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end
      end

      def set_urls(res)
        @profile_url = res['profile']
      end

  end
end
