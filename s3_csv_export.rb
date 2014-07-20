require 'fog'

connection = Fog::Storage.new({
  :provider                 => 'AWS',
  :aws_access_key_id        => 'AKIAII35IB2UZQIB7X3Q',
  :aws_secret_access_key    => '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'
})

directory = connection.directories.get('uz_leads_list_staging')

