require 'tweetstream'
require 'csv'
require 'logger'

logger = Logger.new File.new('logs/tweetstream.log')

output_csv_path = 'tweet_collector_output.csv'

TweetStream.configure do |config|
  config.consumer_key       = '9fiOa2gB2AagQsUlq7ERTjc5H'
  config.consumer_secret    = 'IL9w4UtGcQaij5lUf8vAjkGHEBCG0UnTIzX2vaDiIJRhzvTgfM'
  config.oauth_token        = '132980832-ib95N4jIqrHTLxICG1u3qJqwLGSc0XD0vSNl8kQJ'
  config.oauth_token_secret = 'aAlX3vKFL7Us23DvOg6OOSg8MgkTDVFKUfvOh5AE8XAbE'
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
client.track('Nabe', 'Tempura', 'Yaki', 'Udon', 'California Roll', 'Maki', 'Miso', 'Gyoza', 'Yakitori') do |tweet|
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
