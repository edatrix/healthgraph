module Healthgraph
  class FitnessActivities

    def initialize(res)

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
