require 'spec_helper'

describe Healthgraph::User do

  describe "user object" do
  end

  describe "fetching a user" do

    # let(:user) { Healthgraph::User.new(ENV['HEALTHGRAPH_TOKEN']) }

    it "has urls", :vcr do
      user = Healthgraph::User.new(ENV['HEALTHGRAPH_TOKEN'])
      expect(user.profile_url).to be_a(String)
      expect(user.settings_url).to be_a(String)
      expect(user.fitness_activities_url).to be_a(String)
      expect(user.strength_training_activities_url).to be_a(String)
      expect(user.background_activities_url).to be_a(String)
      expect(user.sleep_url).to be_a(String)
      expect(user.nutrition_url).to be_a(String)
      expect(user.weight_url).to be_a(String)
      expect(user.general_measurements_url).to be_a(String)
      expect(user.diabetes_url).to be_a(String)
      expect(user.records_url).to be_a(String)
      expect(user.team_url).to be_a(String)
      expect(user.change_log_url).to be_a(String)
    end

    it "has a user id", :vcr do
      user = Healthgraph::User.new(ENV['HEALTHGRAPH_TOKEN'])
      expect(user.userID).to be_a(Fixnum)
    end

    it "has an access token", :vcr do
      user = Healthgraph::User.new(ENV['HEALTHGRAPH_TOKEN'])
      expect(user.access_token).to be_a(String)
    end

  end
end
