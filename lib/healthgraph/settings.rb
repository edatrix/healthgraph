module Healthgraph
  class Settings

    attr_reader :twitter_connected, :facebook_connected, :foursquare_connected,
                :share_fitness_activities, :share_map, :post_fitness_activity_facebook,
                :post_fitness_activity_twitter, :post_live_fitness_activity_facebook,
                :post_live_fitness_activity_twitter, :share_background_activities,
                :post_background_activity_facebook, :post_background_activity_twitter,
                :share_sleep, :post_sleep_facebook, :post_sleep_twitter,
                :share_nutrition, :post_nutrition_facebook,
                :post_nutrition_twitter, :share_weight, :post_weight_facebook,
                :post_weight_twitter, :post_general_measurements_facebook,
                :post_general_measurements_twitter, :share_diabetes,
                :post_diabetes_facebook, :post_diabetes_twitter, :distance_units,
                :weight_units, :first_day_of_week

    def initialize(res)
      res.each do |property, value|
        instance_variable_set("@#{property}", value)
      end
    end

    class << self

      def get(token, url)
        res = Healthgraph::connection.get url, {
            access_token: token
        }
        res = JSON.parse(res.body)
        new(res)
      end

    end

  end
end
