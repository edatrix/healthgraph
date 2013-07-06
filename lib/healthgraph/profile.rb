module Healthgraph
  class Profile

    attr_reader :name, :location, :athlete_type, :gender, :birthday, :elite,
                :profile, :small_picture, :normal_picture, :medium_picture,
                :large_picture

    def initialize(res)
      @name = res['name']
      @location = res['location']
      @athlete_type = res['athlete_type']
      @gender = res['gender']
      @birthday = res['birthday']
      @elite = res['elite']
      @profile = res['profile']
      @small_picture = res['small_picture']
      @normal_picture = res['normal_picture']
      @medium_picture = res['medium_picture']
      @large_picture = res['large_picture']
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
