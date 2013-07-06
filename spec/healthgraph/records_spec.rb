require 'spec_helper'

describe Healthgraph::Records, :vcr do

  describe "properties" do
    let(:user) { Healthgraph::User.get(ENV['HEALTHGRAPH_TOKEN']) }
    let(:records) { user.records }

    it "tracks running" do
      expect(records).to respond_to(:running)
      expect(records.running).to have_key(:overall)
    end

    it "tracks cycling" do
      expect(records).to respond_to(:cycling)
      expect(records.cycling).to have_key(:overall)
    end

    it "tracks mountain biking" do
      expect(records).to respond_to(:mountain_biking)
      expect(records.mountain_biking).to have_key(:overall)
    end

    it "tracks walking" do
      expect(records).to respond_to(:walking)
      expect(records.walking).to have_key(:overall)
    end

    it "tracks hiking" do
      expect(records).to respond_to(:hiking)
      expect(records.hiking).to have_key(:overall)
    end

    it "tracks downhill skiing" do
      expect(records).to respond_to(:downhill_skiing)
      expect(records.downhill_skiing).to have_key(:overall)
    end

    it "tracks cross-country-skiing" do
      expect(records).to respond_to(:cross_country_skiing)
      expect(records.cross_country_skiing).to have_key(:overall)
    end

    it "tracks snowboarding" do
      expect(records).to respond_to(:snowboarding)
      expect(records.snowboarding).to have_key(:overall)
    end

    it "tracks skating" do
      expect(records).to respond_to(:skating)
      expect(records.skating).to have_key(:overall)
    end

    it "tracks swimming" do
      expect(records).to respond_to(:swimming)
      expect(records.swimming).to have_key(:overall)
    end

    it "tracks wheelchair" do
      expect(records).to respond_to(:wheelchair)
      expect(records.wheelchair).to have_key(:overall)
    end

    it "tracks rowing" do
      expect(records).to respond_to(:rowing)
      expect(records.rowing).to have_key(:overall)
    end

    it "tracks elliptical" do
      expect(records).to respond_to(:elliptical)
      expect(records.elliptical).to have_key(:overall)
    end

    it "tracks other" do
      expect(records).to respond_to(:other)
      expect(records.other).to have_key(:overall)
    end


  end

  describe ".set_var_name" do
    it "returns a valid instance var name" do
      test_str = 'Cross-country skiing'
      user = Healthgraph::User.get(ENV['HEALTHGRAPH_TOKEN'])
      records = user.records
      expect( records.send(:set_var_name, test_str) ).to eql('cross_country_skiing')
    end
  end

end
