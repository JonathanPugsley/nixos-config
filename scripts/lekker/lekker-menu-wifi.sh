#! /usr/bin/env bash
# wifi selection menu

new_connection() {
    notify-send "Lekker Wifi Menu" "Scanning for available connections..."
    local ssid
    readarray -t ssid <<<"$(
        nmcli -t -f SECURITY,SSID device wifi list \
        | awk -F: '$2 != "" && $1 != "--" {printf "%-30s [%s]\n", $2, $1}'
    )"
    sel=$( printf "%s\n" "${ssid[@]}" | lekker-launcher -l "${#ssid[@]}" -w 450 ) || exit 0

    # extract selected SSID
    sel_ssid=${sel%%[[]*}
    sel_ssid=${sel_ssid%"${sel_ssid##*[![:space:]]}"}

    # password input
    while true; do
        wifi_pass=$( lekker-launcher -l 0 -p "Password" -password ) || exit 0
        notify-send -a "lekker" "Lekker Wifi Menu" "Connecting to $sel_ssid..."
        if nmcli dev wifi connect "$sel_ssid" password "$wifi_pass" 2>&1; then
            notify-send -a "lekker" "Lekker Wifi Menu" "Successfully connected to $sel_ssid"
            break
        else
            notify-send -a "lekker" "Lekker Wifi Menu" "Failed to connect to $sel_ssid"
            nmcli connection delete "$sel_ssid"
        fi
    done
}

remove_connection() {
    local ssid
    readarray -t ssid <<<"$(
        nmcli -f "NAME" connection show \
        | sed 1d \
        | sed '/^lo[[:space:]]*$/d' \
    )"
    echo "${ssid[@]}"
    sel_ssid=$( printf "%s\n" "${ssid[@]}" | lekker-launcher -l "${#ssid[@]}" ) || exit 0
    sel_ssid="${sel_ssid%"${sel_ssid##*[![:space:]]}"}" # remove trailing whitespace
    notify-send -a "lekker" "Lekker Wifi Menu" "Removed connection $sel_ssid"
    nmcli connection delete "$sel_ssid"
}

toggle_wifi() {
    if [[ "$connected" =~ "enabled" ]]; then
        nmcli radio wifi off
    else
        nmcli radio wifi on
    fi
}

menu() {
    # dynamic menu option to enable/disable wifi controller
    local status
    connected=$(nmcli -fields WIFI g)
    if [[ "$connected" =~ "enabled" ]]; then
        status="󰖪  Disable Wi-Fi"
    else
        status="󰖩  Enable Wi-Fi"
    fi

    # menu
    local options
    options=( "$status" "Add Connection" "Remove Connection" )
    sel=$( printf "%s\n" "${options[@]}" | lekker-launcher -l "${#options[@]}" -p "󰖩 " ) || exit 0
    case "$sel" in
        "$status") toggle_wifi ;;
        "Add Connection") new_connection ;;
        "Remove Connection") remove_connection ;;
        *) exit 1 ;;
    esac
}

menu
