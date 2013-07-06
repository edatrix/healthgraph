module Healthgraph
  class Records

    def initialize(res)
      res.each do |activity|
        var_name = set_var_name(activity['activity_type'])
        instance_variable_set("@#{var_name}", set_records(activity))
        Records.class_eval {attr_reader var_name.to_sym}
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

    protected

    # removes spaces and hyphens, replaces with underscores
    def set_var_name(str)
      str.downcase.gsub(/[\s+-]/, '_')
    end

    def set_records(activity)
      answer = {}
      activity['stats'].each do |stat_hash|
        key = stat_hash['stat_type'].downcase.to_sym
        answer[key] = stat_hash['value']
      end
      answer
    end

  end
end
