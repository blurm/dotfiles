#! /bin/sh
KEY="f7794aaec722177e432098bfc06c29b51c4114bd"
CITY="beijing"
API_URL="https://api.waqi.info/feed/"

data=$(curl -sf "${API_URL}${CITY}/?token=${KEY}")

if [ -n "$data" ]; then
    status=$(echo "$data" | jq -r ".status")
    if [[ -n "$status" && $status = "ok" ]]; then
        pm25=$(echo "$data" | jq -r ".data.iaqi.pm25.v")
        pm10=$(echo "$data" | jq -r ".data.iaqi.pm10.v")

        if [ $pm10 -ge $pm25 ]; then
            result=$pm10
        else
            result=$pm25
        fi
        echo "$result"
    else
        result=""
    fi
fi

#https://api.waqi.info/feed/beijing/?token=f7794aaec722177e432098bfc06c29b51c4114bd







