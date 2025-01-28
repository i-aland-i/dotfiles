#!/bin/bash

# Thresholds (adjust if needed)
THRESHOLD_20=20
THRESHOLD_10=10

# Track previous state
prev_percent=""
prev_status=""

while true; do
  # Get battery info
  BATTERY_PATH=$(upower -e | grep -i battery)
  current_percent=$(upower -i "$BATTERY_PATH" | grep percentage | awk '{print $2}' | tr -d '%')
  current_status=$(upower -i "$BATTERY_PATH" | grep state | awk '{print $2}')

  # Initialize prev_percent on first run
  if [[ -z "$prev_percent" ]]; then
    prev_percent=$current_percent
    prev_status=$current_status
  fi

  # Reset notifications if charging starts
  if [[ "$prev_status" == "discharging" && "$current_status" != "discharging" ]]; then
    notified_20=false
    notified_10=false
  fi

  # Check for threshold crossings
  if [[ "$current_status" == "discharging" ]]; then
    # 20% alert (only once per discharge cycle)
    if [[ "$prev_percent" -gt $THRESHOLD_20 && "$current_percent" -le $THRESHOLD_20 ]]; then
      notify-send -u critical "Battery Low" "Battery at $current_percent%!"
    fi

    # 10% alert (only once per discharge cycle)
    if [[ "$prev_percent" -gt $THRESHOLD_10 && "$current_percent" -le $THRESHOLD_10 ]]; then
      notify-send -u critical "Battery Critical" "Battery at $current_percent%!"
    fi
  fi

  # Update previous values
  prev_percent=$current_percent
  prev_status=$current_status

  sleep 150 # Check every 2.5 minutes
done
