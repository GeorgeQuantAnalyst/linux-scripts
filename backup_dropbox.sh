#!/bin/bash -e

readonly time_stamp=$(date +"%Y%m%d %T")
readonly zip_file_name=Dropbox_$(date +"%Y%m%d").zip

echo "Start backup"
rm ${zip_file_name}
zip ${zip_file_name} -r  ~/Dropbox
echo "Finished backup"
