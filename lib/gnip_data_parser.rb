require 'json'

class GnipDataParser
  def self.parse_json_data(json_string)
    data = JSON.parse(json_string)

    tweet_data_hash = {}

    if data["actor"].nil?
      tweet_data_hash[:screen_name] = ''
      tweet_data_hash[:profile_image_url] = ''
    else
      tweet_data_hash[:screen_name] = data["actor"]["preferredUsername"].to_s.encode('utf-8')
      tweet_data_hash[:profile_image_url] = data["actor"]["image"].to_s.encode('utf-8')
    end

    tweet_data_hash[:tweet_body] = data["body"].to_s.encode('utf-8')

    if data["location"].nil?
      tweet_data_hash[:location] = ''
    else
      tweet_data_hash[:location] = 'data["location"]["name"].to_s.encode('utf-8')'
    end

    if data["gnip"].nil?
      tweet_data_hash[:gnip_matching_rules] = ''
    else
      tweet_data_hash[:gnip_matching_rules] = data["gnip"]["matching_rules"][0]["value"].to_s.encode('utf-8')
    end

    return tweet_data_hash

  end
end


