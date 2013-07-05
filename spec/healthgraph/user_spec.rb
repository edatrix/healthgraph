require 'spec_helper'

describe Healthgraph::User do

  describe "fetching a user", :vcr do

    # let(:user) { Healthgraph::User.new(ENV['HEALTHGRAPH_TOKEN']) }

    it "has a profile url" do
      user = Healthgraph::User.new(ENV['HEALTHGRAPH_TOKEN'])
      # expect(user.profile_url).to be_a(String)
    end

  end
end
