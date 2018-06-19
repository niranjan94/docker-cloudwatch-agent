#!/usr/bin/env sh

echo "Verifying aws-scripts-mon"

/aws-scripts-mon/mon-put-instance-data.pl --mem-util --mem-used --mem-avail --disk-space-util --disk-space-used --disk-space-avail --memory-units=megabytes --disk-space-units=gigabytes --verbose --disk-path=/ --verify --verbose

echo "Starting crond"

crond -l 2 -f
