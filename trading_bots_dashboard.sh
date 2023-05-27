#!/bin/bash

BOT_NAMES=("early-reaction-bot-bybit-intraday" \
"early-reaction-bot-bybit-swing" \
"early-reaction-bot-bybit-position" \
"place-trailing-stops-bot-bybit-intraday" \
"place-trailing-stops-bot-bybit-swing" \
"place-trailing-stops-bot-bybit-position" \
"crypto-trend-screener-bot" \
"forex-trend-screener-bot")

LOG_PATHS=("${HOME}/log/early-reaction-bot-bybit-intraday/early_reaction_bot_bybit_intraday.log" \
"${HOME}/log/early-reaction-bot-bybit-swing/early_reaction_bot_bybit_swing.log" \
"${HOME}/log/early-reaction-bot-bybit-position/early_reaction_bot_bybit_position.log" \
"${HOME}/log/place-trailing-stops-bot-bybit-intraday/place_trailing_stops_bot_bybit_intraday.log" \
"${HOME}/log/place-trailing-stops-bot-bybit-swing/place_trailing_stops_bot_bybit_swing.log" \
"${HOME}/log/place-trailing-stops-bot-bybit-position/place_trailing_stops_bot_bybit_position.log" \
"${HOME}/log/crypto-trend-screener-bot/crypto_trend_screener_bot.log" \
"${HOME}/log/forex-trend-screener-bot/forex_trend_screener_bot.log")

ERRORS_LOG_PATHS=("${HOME}/log/early-reaction-bot-bybit-intraday/early_reaction_bot_bybit_intraday_error.log" \
"${HOME}/log/early-reaction-bot-bybit-swing/early_reaction_bot_bybit_swing_error.log" \
"${HOME}/log/early-reaction-bot-bybit-position/early_reaction_bot_bybit_position_error.log" \
"${HOME}/log/place-trailing-stops-bot-bybit-intraday/place_trailing_stops_bot_bybit_intraday_error.log" \
"${HOME}/log/place-trailing-stops-bot-bybit-swing/place_trailing_stops_bot_bybit_swing_error.log" \
"${HOME}/log/place-trailing-stops-bot-bybit-position/place_trailing_stops_bot_bybit_position_error.log" \
"${HOME}/log/crypto-trend-screener-bot/crypto_trend_screener_bot_error.log" \
"${HOME}/log/forex-trend-screener-bot/forex_trend_screener_bot_error.log")

echo "---------------------------------------------------"
echo Trading bots dashboard
echo "---------------------------------------------------"

echo
echo

for i in "${!BOT_NAMES[@]}"
do

	echo "********************************************"
	echo "# ${BOT_NAMES[$i]}"
	echo "********************************************"

	echo
	echo "## Start and finish time (last 6)"
	echo

	grep "INFO - Start\|INFO - Finished" ${LOG_PATHS[$i]} | tail -12

	

	echo
	echo "## List of errors in app (last 5)"
	echo

	grep "ERROR"  -B 1 ${ERRORS_LOG_PATHS[$i]} | tail -10
	tail -1 ${ERRORS_LOG_PATHS[$i]}

	echo
	echo

	if [ ${BOT_NAMES[$i]} = "place-trailing-stops-bot-bybit-intraday"  ]
	then
    		echo
    		echo "## Place trailing stops intraday (this day)"
    		echo

    		grep "Successfull place trailing stop" ${LOG_PATHS[3]}
	fi
	
	if [ ${BOT_NAMES[$i]} = "place-trailing-stops-bot-bybit-swing" ]
	then
    	echo
    	echo "## Place trailing stops swing (this day)"
    	echo
	
    	grep "Successfull place trailing stop" ${LOG_PATHS[4]}
	fi

	if [ ${BOT_NAMES[$i]} = "place-trailing-stops-bot-bybit-position" ]
	then
    		echo
    		echo "## Place trailing stops position (this day)"
    		echo

    		grep "Successfull place trailing stop" ${LOG_PATHS[5]}
	fi

done
	
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