#!/bin/bash -e

#title           :compress_and_remove_old_rolling_logs_job.sh
#description     :Bash script compress and remove old rolling logs for jobs
#author	         :George
#date            :20230226
#version         :1.0.0
#usage		 :bash compress_and_remove_old_rolling_logs_job.sh
#bash_version    :5.0.17(1)-release
#====================================================================================================================

APP_LOG_FOLDERS=("/home/prod1/log/bybit-place-trailing-stops-job-swing/" "/home/prod1/log/bybit-place-trailing-stops-job-position/")

echo "Start job"
for log_folder in "${APP_LOG_FOLDERS[@]}"; do
        echo "Process log folder: ${log_folder}"
        cd $log_folder

        echo "Compress rolling files to gz and move to archive"
        gzip *log.*
        mkdir -p archive
        mv *.gz archive/

        echo "Delete old log files (older than 7 days)"
        cd archive
        find . -name "*log.*" -type f -mtime +7 -delete
done
echo "Finished job"
