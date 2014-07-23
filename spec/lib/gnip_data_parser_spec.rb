require 'gnip_data_parser'
require 'json'

RSpec.describe GnipDataParser do

  it "should return a tweet hash with valid json" do
    # Adding the line below, otherwise rspec cannot find the data file
    file = File.dirname(__FILE__) + '/../fixtures/gnip_data/individual_tweet.json'
    json_object = File.read(file)
    tweet_hash = GnipDataParser.parse_json_data(json_object)
    expect(tweet_hash[:tweet_poster_display_name]).to eq "Jexyvs ♛"
  end

end