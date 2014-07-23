require 'json'

class GnipDataParser
  def self.parse_json_data(json_object)
    data = JSON.parse(json_object)
    tweet_data_hash = {
      tweet_id: data["id"].to_s.encode('utf-8') || '',
      tweet_poster_user_id: data["actor"]["id"].to_s.encode('utf-8') || '',
      tweet_poster_profile_link: data["actor"]["id"].to_s.encode('utf-8') || '',
      tweet_poster_display_name: data["actor"]["displayName"].to_s.encode('utf-8') || '',
      tweet_user_image: data["actor"]["image"].to_s.encode('utf-8') || '',
      tweet_user_summary: data["actor"]["summary"].to_s.encode('utf-8') || '',
      tweet_user_friends_count: data["actor"]["friendsCount"].to_s.encode('utf-8') || '',
      tweet_user_followers_count: data["actor"]["followersCount"].to_s.encode('utf-8') || '',
      tweet_post_time: data["postedTime"].to_s.encode('utf-8') || '',
      tweet_body: data["body"].to_s.encode('utf-8') || '',
      user_location: data["location"]["name"].to_s.encode('utf-8') || '',
      user_location_country_code: data["location"]["twitter_country_code"].to_s.encode('utf-8') || '',
      gnip_matching_rules: data["gnip"]["matching_rules"].to_s.encode('utf-8') || ''
    }
    return tweet_data_hash
  end
end


