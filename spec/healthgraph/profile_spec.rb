require 'spec_helper'

describe Healthgraph::Profile do
  it "has profile properties", :vcr do
    user = Healthgraph::User.get(ENV['HEALTHGRAPH_TOKEN'])
    profile = user.profile
    expect(profile.elite).to be_a(String)
    expect(profile.profile).to be_a(String)
    expect(profile).to respond_to(:name)
    expect(profile).to respond_to(:location)
    expect(profile).to respond_to(:athlete_type)
    expect(profile).to respond_to(:gender)
    expect(profile).to respond_to(:birthday)
    expect(profile).to respond_to(:small_picture)
    expect(profile).to respond_to(:normal_picture)
    expect(profile).to respond_to(:medium_picture)
    expect(profile).to respond_to(:large_picture)
  end

end
