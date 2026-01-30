#! /usr/bin/env bash
# wifi selection menu

new_connection() {
    notify-send "Lekker Wifi Menu" "Scanning for available connections..."
    display=()
    raw_ssids=()

    # find information of nearby networks
    while IFS=: read -r sec ssid inuse freq signal; do
        [[ -z "$ssid" ]] && continue

        # security icon
        [[ "$sec" =~ WPA ]] && icon="" || icon=""

        # signal bars (0-100)
        if (( signal > 0 && signal <= 25 )); then
            signal_bars="▂▁▁▁"
        elif (( signal > 25 && signal <= 50 )); then
            signal_bars="▂▄▁▁"
        elif (( signal > 50 && signal <= 75 )); then
            signal_bars="▂▄▆▁"
        elif (( signal > 75 && signal <= 100 )); then
            signal_bars="▂▄▆█"
        else
            signal_bars="▁▁▁▁"
        fi

        # band
        freq=${freq//[^0-9]/}
        if (( freq >= 5925 && freq <= 7125 )); then band="6G"
        elif (( freq >= 5150 && freq <= 5850 )); then band="5G"
        elif (( freq >= 2400 && freq <= 2483 )); then band="2.4G"
        else band="?"
        fi

        display+=( "$(printf "%s  %-25s %-8s %s" "$icon" "$ssid $inuse" "$signal_bars" "$band")" )
        raw_ssids+=( "$ssid" )
    done < <(nmcli -t -f SECURITY,SSID,IN-USE,FREQ,SIGNAL device wifi list)

    selected_line=$(printf "%s\n" "${display[@]}" | lekker-launcher -l "${#display[@]}" -w 500 ) || exit 0

    # find corresponding SSID
    for i in "${!display[@]}"; do
        if [[ "${display[$i]}" == "$selected_line" ]]; then
            sel_ssid="${raw_ssids[$i]}"
            break
        fi
    done

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
    readarray -t ssid <<<"$(
        nmcli -f "NAME" connection show \
        | sed 1d \
        | sed '/^lo[[:space:]]*$/d' \
    )"
    sel_ssid=$( printf "%s\n" "${ssid[@]}" | lekker-launcher -l "${#ssid[@]}" ) || exit 0
    sel_ssid="${sel_ssid%"${sel_ssid##*[![:space:]]}"}" # remove trailing whitespace
    notify-send -a "lekker" "Lekker Wifi Menu" "Removed connection $sel_ssid"
    nmcli connection delete "$sel_ssid"
}

toggle_wifi() {
    if [[ "$connected" =~ "enabled" ]]; then
        notify-send -a "lekker" "Lekker Wifi Menu" "Wifi Disabled"
        nmcli radio wifi off
    else
        notify-send -a "lekker" "Lekker Wifi Menu" "Wifi Enabled"
        nmcli radio wifi on
    fi
}

menu() {
    # dynamic menu option to enable/disable wifi controller
    connected=$( nmcli -fields WIFI g )
    if [[ "$connected" =~ "enabled" ]]; then
        status="󰖪  Disable Wi-Fi"
    else
        status="󰖩  Enable Wi-Fi"
    fi

    # menu
    options=( "$status" "Add Connection" "Remove Connection" )
    sel=$( printf "%s\n" "${options[@]}" | lekker-launcher -l "${#options[@]}" -p "Network") || exit 0
    case "$sel" in
        "$status") toggle_wifi ;;
        "Add Connection") new_connection ;;
        "Remove Connection") remove_connection ;;
        *) exit 1 ;;
    esac
}

menu
