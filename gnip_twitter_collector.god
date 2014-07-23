God.watch do |w|
  w.name = "simple"
  w.start = "ruby gnip_twitter_collector.rb"
  w.keepalive
end