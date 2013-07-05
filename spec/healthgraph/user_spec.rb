require 'spec_helper'

describe Healthgraph::User do

  describe "user" do
  end

  describe "fetching a user", :vcr do

    # let(:user) { Healthgraph::User.new(ENV['HEALTHGRAPH_TOKEN']) }

    it "has a profile url" do
      user = Healthgraph::User.new(ENV['HEALTHGRAPH_TOKEN'])
      expect(user.profile_url).to be_a(String)
    end

    it "has a settings url" do
      user = Healthgraph::User.new(ENV['HEALTHGRAPH_TOKEN'])
      expect(user.settings_url).to be_a(String)
    end

  end
end
