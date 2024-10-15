#!/usr/bin/env zsh

# Variables
LAPTOP_MONITOR="eDP-1"
EXTERNAL_MONITOR="HDMI-A-1"
LAPTOP_RESOLUTION="1920x1080"
EXTERNAL_RESOLUTION="2560x1440@60,0x0,1"  # Adjust to your external monitor's resolution

# Function to set monitor configuration
set_monitor_config() {
    local monitor="$1"
    local resolution="$2"
    hyprctl keyword monitor "$monitor, enable"
    hyprctl keyword monitor "$monitor, resolution $resolution"
}

# Function to disable monitor
disable_monitor() {
    local monitor="$1"
    hyprctl keyword monitor "$monitor, disable"
}

# Check input argument and apply configuration
if [ "$1" = "laptop" ]; then
    disable_monitor "$EXTERNAL_MONITOR"
    set_monitor_config "$LAPTOP_MONITOR" "$LAPTOP_RESOLUTION"
elif [ "$1" = "external" ]; then
    disable_monitor "$LAPTOP_MONITOR"
    set_monitor_config "$EXTERNAL_MONITOR" "$EXTERNAL_RESOLUTION"
else
    echo "Usage: $0 {laptop|external}"
    exit 1
fi

