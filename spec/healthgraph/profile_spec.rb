require 'spec_helper'

describe Healthgraph::Profile do
  it "has profile properties", :vcr do
    user = Healthgraph::User.get(ENV['HEALTHGRAPH_TOKEN'])
    profile = user.profile
    expect(profile.name).to be_a(String)
    expect(profile.location).to be_a(String)
    expect(profile.athlete_type).to be_a(String)
    expect(profile.gender).to be_a(String)
    expect(profile.birthday).to be_a(String)
    expect(profile.elite).to be_a(String)
    expect(profile.profile).to be_a(String)
    expect(profile).to respond_to(:small_picture)
    expect(profile).to respond_to(:normal_picture)
    expect(profile).to respond_to(:medium_picture)
    expect(profile).to respond_to(:large_picture)
  end

end
