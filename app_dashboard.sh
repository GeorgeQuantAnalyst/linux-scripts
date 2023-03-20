#!/bin/bash

BYBIT_PLACE_TRAILING_STOPS_JOB_SWING_LOG="${HOME}/log/bybit-place-trailing-stops-job-swing/bybit_place_trailing_stops_job_swing.log"
BYBIT_PLACE_TRAILING_STOPS_JOB_SWING_ERR_LOG="${HOME}/log/bybit-place-trailing-stops-job-swing/bybit_place_trailing_stops_job_swing_error.*"
BYBIT_PLACE_TRAILING_STOPS_JOB_POSITION_LOG="${HOME}/log/bybit-place-trailing-stops-job-position/bybit_place_trailing_stops_job_position.log"
BYBIT_PLACE_TRAILING_STOPS_JOB_POSITION_ERR_LOG="${HOME}/log/bybit-place-trailing-stops-job-position/bybit_place_trailing_stops_job_position_error.*"

echo "---------------------------------------------------"
echo App dashboard
echo "---------------------------------------------------"

echo

echo "********************************************"
echo "# bybit-place-trailing-stops-swing"
echo "********************************************"


echo
echo "## Start and finish job time (last 10)"
echo

grep "Start job\|Finished job" ${BYBIT_PLACE_TRAILING_STOPS_JOB_SWING_LOG} | tail -10


echo
echo "## Place trailing stops (this day)"
echo 

grep "Successfull place trailing stop" ${BYBIT_PLACE_TRAILING_STOPS_JOB_SWING_LOG}


echo
echo "## List of errors in app (last 5)"
echo

grep "ERROR"  -B 1 ${BYBIT_PLACE_TRAILING_STOPS_JOB_SWING_ERR_LOG} | tail -20
tail -1 ${BYBIT_PLACE_TRAILING_STOPS_JOB_SWING_ERR_LOG}

echo
echo

echo "********************************************"
echo "# bybit-place-trailing-stops-position"
echo "********************************************"

echo
echo "## Start and finish job time (last 10)"
echo

grep "Start job\|Finished job" ${BYBIT_PLACE_TRAILING_STOPS_JOB_POSITION_LOG} | tail -10


echo
echo "## Place trailing stops (this day)"
echo

grep "Successfull place trailing stop" ${BYBIT_PLACE_TRAILING_STOPS_JOB_POSITION_LOG}


echo
echo "## List of errors in app (last 5)"
echo

grep "ERROR" -B 1 ${BYBIT_PLACE_TRAILING_STOPS_JOB_POSITION_ERR_LOG} | tail -20
tail -1 ${BYBIT_PLACE_TRAILING_STOPS_JOB_POSITION_ERR_LOG}

echo
echo

echo "********************************************"
echo "# System monitor"
echo "********************************************"

echo
echo "## RAM usage"
echo

free -h


echo
echo "## Disk usage"
echo

df -h | grep "root" -B 1
