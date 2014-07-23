$:.unshift File.dirname(__FILE__)

require 'gnip-stream'
require 'json'
require 'lib/gnip_data_parser'
require 'csv'
require 'logger'

output_csv_path = "gnip_output.csv"
opened_csv_to_write = CSV.open(output_csv_path, "a+")

logger = Logger.new('logs/application.log')

twitter_stream = GnipStream::PowertrackClient.new("https://stream.gnip.com:443/accounts/Urbanzeak/publishers/twitter/streams/track/prod.json", "prashant@urbanzeak.com", "KHELDAR@123")

twitter_stream.consume do |message|
  #process the message however you want
  begin
    message_hash = GnipDataParser.parse_json_data(message)
    opened_csv_to_write << message_hash.values
  rescue Exception => e
    logger.error e
  end

end