$:.unshift File.dirname(__FILE__)

require 'gnip-stream'
require 'json'
require 'lib/gnip_data_parser'
require 'csv'

output_csv_path = "gnip_output.csv"
opened_csv_to_write = CSV.open(output_csv_path, "a+")

twitter_stream = GnipStream::PowertrackClient.new("https://stream.gnip.com:443/accounts/Urbanzeak/publishers/twitter/streams/track/prod.json", "prashant@urbanzeak.com", "KHELDAR@123")

twitter_stream.consume do |message|
  #process the message however you want
  message_hash = GnipDataParser.parse_json_data(message)
   opened_csv_to_write {|csv| csv<< data.values }
end