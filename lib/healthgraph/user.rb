require 'faraday'
require 'json'

module Healthgraph
  class User

    attr_reader :access_token, :profile_url, :settings_url,
        :fitness_activities_url, :strength_training_activities_url,
        :background_activities_url, :sleep_url, :nutrition_url, :weight_url,
        :general_measurements_url, :diabetes_url, :records_url, :team_url,
        :change_log_url, :userID

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
      @userID = res['userID']
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
        @settings_url = res['settings']
        @fitness_activities_url = res['fitness_activities']
        @strength_training_activities_url = res['strength_training_activities']
        @background_activities_url = res['background_activities']
        @sleep_url = res['sleep']
        @nutrition_url = res['nutrition']
        @weight_url = res['weight']
        @general_measurements_url = res['general_measurements']
        @diabetes_url = res['diabetes']
        @records_url = res['records']
        @team_url = res['team']
        @change_log_url = res['change_log']
      end

  end
end
