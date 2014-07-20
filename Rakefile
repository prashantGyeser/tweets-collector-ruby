require 'csv'
require 's3'
require 'logger'

service = S3::Service.new(:access_key_id => "AKIAII35IB2UZQIB7X3Q",
                          :secret_access_key => "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")

bucket_to_store_csv_in  = service.buckets.find("uz_leads_list_staging")

