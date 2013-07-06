require 'spec_helper'

describe Healthgraph::Settings, :vcr do

  it "has settings properties" do
    user = Healthgraph::User.get(ENV['HEALTHGRAPH_TOKEN'])
    settings = user.settings
    expect(settings).to respond_to(:twitter_connected)
    expect(settings).to respond_to(:facebook_connected)
    expect(settings).to respond_to(:foursquare_connected)
    expect(settings.share_fitness_activities).to be_a(String)
    expect(settings.share_map).to be_a(String)
    expect(settings).to respond_to(:post_fitness_activity_facebook)
    expect(settings).to respond_to(:post_fitness_activity_twitter)
    expect(settings).to respond_to(:post_live_fitness_activity_facebook)
    expect(settings).to respond_to(:post_live_fitness_activity_twitter)
    expect(settings.share_background_activities).to be_a(String)
    expect(settings).to respond_to(:post_background_activity_facebook)
    expect(settings).to respond_to(:post_background_activity_twitter)
    expect(settings).to respond_to(:share_sleep)
    expect(settings).to respond_to(:post_sleep_facebook)
    expect(settings).to respond_to(:post_sleep_twitter)
    expect(settings.share_nutrition).to be_a(String)
    expect(settings).to respond_to(:post_nutrition_facebook)
    expect(settings).to respond_to(:post_nutrition_twitter)
    expect(settings.share_weight).to be_a(String)
    expect(settings).to respond_to(:post_weight_facebook)
    expect(settings).to respond_to(:post_weight_twitter)
    expect(settings).to respond_to(:post_general_measurements_facebook)
    expect(settings).to respond_to(:post_general_measurements_twitter)
    expect(settings.share_diabetes).to be_a(String)
    expect(settings).to respond_to(:post_diabetes_facebook)
    expect(settings).to respond_to(:post_diabetes_twitter)
    expect(settings.distance_units).to be_a(String)
    expect(settings.weight_units).to be_a(String)
    expect(settings.first_day_of_week).to be_a(String)


    # expect().to be_a(String)
  end

end
