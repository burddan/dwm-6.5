#!/bin/sh

ALERT_20="false"
ALERT_10="false"
NOT_CHARGING="true"

while true; do
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    if [ "$CHARGE" -le 20 ] && [ "$CHARGE" -gt 10 ] && [ "$STATUS" = "Discharging" ] && [ "$ALERT_20" = "false" ] && [ "$NOT_CHARGING" = "true" ]; then
        dunstify "battery below 20%, charge your X230"
        notify-send -i /home/burddan/pictures/allert20percent.jpg ""
        ALERT_20="true"
    fi

    if [ "$CHARGE" -le 10 ] && [ "$STATUS" = "Discharging" ] && [ "$ALERT_10" = "false" ] && [ "$NOT_CHARGING" = "true" ]; then
        dunstify "battery below 10%, charge your X230 immediately!"
        notify-send -i /home/burddan/pictures/allert10percent.jpg ""
        ALERT_10="true"
    fi

    if [ "$CHARGE" -gt 20 ]; then
        ALERT_20="false"
    fi

    if [ "$CHARGE" -gt 10 ]; then
        ALERT_10="false"
    fi

    if [ "$STATUS" = "Charging" ] && [ "$NOT_CHARGING" = "true" ]; then
        notify-send "charging, resetting alerts"
        NOT_CHARGING="false"
        ALERT_10="false"
        ALERT_20="false"
    elif [ "$STATUS" = "Discharging" ] && [ "$NOT_CHARGING" = "false" ]; then
        NOT_CHARGING="true"
    fi

    sleep 6
done

