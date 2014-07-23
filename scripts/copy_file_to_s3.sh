#!/bin/sh

now=$(date +"%Y-%m-%d-%S")
newfilename="tweets.$now.csv"

echo "The new file name is: $newfilename"

echo "Copying files to s3..."

s3cmd put tweet_collector_output.csv "s3://uz_leads_list_staging/$newfilename"

echo "Removing local file..."

rm tweet_collector_output.csv