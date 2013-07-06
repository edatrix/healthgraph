require 'faraday'
require 'json'

module Healthgraph
  class User

    attr_reader :access_token, :profile_url, :settings_url,
        :fitness_activities_url, :strength_training_activities_url,
        :background_activities_url, :sleep_url, :nutrition_url, :weight_url,
        :general_measurements_url, :diabetes_url, :records_url, :team_url,
        :change_log_url, :userID, :profile, :settings

    def initialize(urls, token)
      @userID = urls['userID']
      @access_token = token
      set_urls(urls)
    end

    def profile
      @profile ||= Healthgraph::Profile.get(@access_token, @profile_url)
    end

    def settings
      @settings ||= Healthgraph::Settings.get(@access_token, @settings_url)
    end

    class << self

      def get(token)
        res = Healthgraph::connection.get '/user', {
            access_token: token
        }
        res = JSON.parse(res.body)
        if res['userID']
          # set_urls(res)
          # @userID = res['userID']
          new(res, token)
        end
      end

    end

    protected

      def set_urls(res)
        @profile_url                      = res['profile']
        @settings_url                     = res['settings']
        @fitness_activities_url           = res['fitness_activities']
        @strength_training_activities_url = res['strength_training_activities']
        @background_activities_url        = res['background_activities']
        @sleep_url                        = res['sleep']
        @nutrition_url                    = res['nutrition']
        @weight_url                       = res['weight']
        @general_measurements_url         = res['general_measurements']
        @diabetes_url                     = res['diabetes']
        @records_url                      = res['records']
        @team_url                         = res['team']
        @change_log_url                   = res['change_log']
      end

  end
end
