require 'bugsnag'

Bugsnag.configure do |config|
  config.api_key = "a7b1df402a18d54e5d1a1480671a3065"
end

at_exit do
  if $!
    Bugsnag.notify($!)
  end
end