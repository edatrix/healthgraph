require 'spec_helper'

describe Healthgraph::FitnessActivities, :vcr do

  let(:user) { Healthgraph::User.get(ENV['HEALTHGRAPH_TOKEN']) }
  let(:fitness_activities) { user.fitness_activities }

  it "returns a list of fitness activites" do
    expect(fitness_activities).to respond_to
  end

end


# fitness_activities = user.fitness_activities
# this has a size property, prev/next URLs, and list of items
# items is a list of activities
# fitness_activities.items.each do |i|
