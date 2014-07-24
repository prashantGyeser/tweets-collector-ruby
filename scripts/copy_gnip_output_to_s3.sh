#!/bin/sh

now=$(date +"%Y-%m-%d-%S")
newfilename="tweets.$now.csv"

echo "The new file name is: $newfilename"

echo "Copying files to s3..."

s3cmd put gnip_output.csv "s3://gnip_output/$newfilename"

echo "Removing local file..."

rm gnip_output.csv