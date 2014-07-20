\curl -sSL https://get.rvm.io | bash
# Todo: The current shell has to reset
apt-get install git
ssh-keygen -t rsa -C "prashant@gyeser.com"

# Starting the process
nohup ruby file_to_run.rb &
# Counting the number of lines in a csv file
wc -l filename.csv

# Pushing the file from digitalocean to s3
s3cmd put tweet_collector_output.csv s3://uz_leads_list_staging


# Copying with a timestamp
now=$(date +"%Y-%m-%d-%S") | newfilelocation="s3://uz_leads_list_staging/tweet_collector_output.$now.csv" |s3cmd put tweet_collector_output.csv echo $newfilelocation" | rm tweet_collector_output.csv
