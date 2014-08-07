require 'tweetstream'
require 'csv'
require 'logger'

logger = Logger.new File.new('logs/tweetstream.log')

output_csv_path = 'tweet_collector_output.csv'

TweetStream.configure do |config|
  config.consumer_key       = 'P1akA2LS1B6VHWiPzfyhDh24u'
  config.consumer_secret    = 'eOuMGTiqXkqalOdGxYdxZiCGL73H5mc43LlswxHsfW3FRIqRoj'
  config.oauth_token        = '2431831016-Tps58cf93MX9uW0n1GX6zXTNzrsYgOj9BIwJoDu'
  config.oauth_token_secret = 'W4mKPVbHybmYgumLzN7RFrCwTyLJoI1I0TIGr5ubsu3Rl'
  config.auth_method        = :oauth
end

client = TweetStream::Client.new

client.on_error do |message|
  logger.error "Error: #{message.join("\n")}"
end

client.on_reconnect do |message|
  logger.info "Reconnecting: #{message.join("\n")}"
end

client.on_limit do |skip_count|
  logger.info "Skipped: #{skip_count.join("\n")}"
end

# Tracking the following tweets
client.track('barbecue', 'steak', 'bbq', 'rodizio', 'churrascaria', 'churrasco', 'hummus', 'falafel', 'shawarma', 'kebab', 'baklava', 'biryani', 'butter chicken', 'tikka', 'naan', 'mocha', 'cappuccino', 'Pizza', 'Pie', 'cocktails', 'Beer', 'Shots' ) do |tweet|
  puts "Storing tweet..."
  data = {
      tweet_id_str: tweet.id.to_s,
      tweet_text: tweet.text,
      twitter_user_screen_name: tweet.user.screen_name,
      twitter_user_id_str: tweet.user.id.to_s,
      twitter_user_description: (tweet.user.description || ''),
      twitter_user_lang: (tweet.user.lang || ''),
      twitter_user_image_url: (tweet.user.profile_image_url || ''),
      twitter_user_location: (tweet.user.location || '')
  }

  CSV.open(output_csv_path, "a+") {|csv| csv<< data.values }

end
