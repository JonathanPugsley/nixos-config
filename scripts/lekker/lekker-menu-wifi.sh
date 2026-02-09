#! /usr/bin/env bash
# wi-fi menu

notify_msg() {
    local message=$1
    notify-send -a "lekker" "Lekker Wi-Fi Menu" "$message"
}

display_known_connections() {
    local ssid sel_ssid
    readarray -t ssid < <( nmcli -f "NAME" connection show |
        sed 1d |
        sed '/^lo[[:space:]]*$/d'
    )
    sel_ssid=$( printf "%s\n" "${ssid[@]}" | lekker-launcher -l "${#ssid[@]}" ) || return 1
    printf '%s\n' "$sel_ssid"
}

add() {
    local display raw_ssids
    local sec ssid inuse freq signal
    local icon signal_bars band
    local selection sel_ssid wifi_pass i
    display=()
    raw_ssids=()

    notify_msg "Scanning for available connections..."

    # find information of nearby networks
    while IFS=: read -r sec ssid inuse freq signal; do
        [[ -z "$ssid" ]] && continue

        # security icon
        icon=""
        [[ "$sec" =~ WPA ]] && icon=""

        # signal bars
        if (( signal > 75 )); then signal_bars="▂▄▆█"
        elif (( signal > 50 )); then signal_bars="▂▄▆▁"
        elif (( signal > 25 )); then signal_bars="▂▄▁▁"
        else signal_bars="▂▁▁▁"
        fi

        # band
        freq="${freq//[^0-9]/}"
        if (( freq >= 5925 )); then band="6G"
        elif (( freq >= 5150 )); then band="5G"
        elif (( freq >= 2400 )); then band="2.4G"
        else band="?"
        fi

        display+=( "$( printf "%s  %-25s %-15s %s" "$icon" "$ssid $inuse" "$signal_bars" "$band" )" )
        raw_ssids+=( "$ssid" )
    done < <(nmcli -t -f SECURITY,SSID,IN-USE,FREQ,SIGNAL device wifi list)

    if [[ "${#display[@]}" -eq 0 ]]; then
        notify_msg "No Wireless Networks Found Nearby"
        return
    fi

    selection=$( printf "%s\n" "${display[@]}" | lekker-launcher -l "${#display[@]}" -w 500 ) || exit 0

    # find corresponding SSID
    for i in "${!display[@]}"; do
        if [[ "${display[$i]}" == "$selection" ]]; then
            sel_ssid="${raw_ssids[$i]}"
            break
        fi
    done

    # password input and connect
    while true; do
        wifi_pass=$( echo "Cancel" | lekker-launcher -l 1 -p "Password" -password ) || exit 0

        notify_msg "Connecting to $sel_ssid..."
        if nmcli dev wifi connect "$sel_ssid" password "$wifi_pass" 2>&1; then
            notify_msg "Successfully connected to $sel_ssid"
            break
        else
            notify_msg "Failed to connect to $sel_ssid"
            nmcli connection delete "$sel_ssid"
        fi
    done
}

remove() {
    local sel_ssid
    sel_ssid="$(display_known_connections)" || exit 0
    sel_ssid="${sel_ssid%"${sel_ssid##*[![:space:]]}"}" # remove trailing whitespace
    notify_msg "Removed network $sel_ssid"
    nmcli connection delete "$sel_ssid"
}

share() {
    local launch_cmd
    launch_cmd="xdg-terminal-exec -e $SHELL -c '
        nmcli device wifi show-password;
        echo -n \"Press any key to exit... \" && read -sr -k 1 ;
        exit'"
    lekker-launch-floating-window "$launch_cmd" -W 375 -H 530
}

saved() {
    local sel_ssid
    sel_ssid="$(display_known_connections)" || exit 0
    sel_ssid="${sel_ssid%"${sel_ssid##*[![:space:]]}"}" # remove trailing whitespace

    # connect
    if nmcli dev wifi connect "$sel_ssid" 2>&1; then
        notify_msg "Successfully connected to $sel_ssid"
    else
        notify_msg "Failed to connect to $sel_ssid"
    fi
}

toggle_wifi() {
    local radio_state=$1
    if [[ "$radio_state" == "enabled" ]]; then
        notify_msg "Wi-Fi Disabled"
        nmcli radio wifi off
    else
        notify_msg "Wi-Fi Enabled"
        nmcli radio wifi on
    fi
}

menu() {
    # dynamic option to enable/disable wifi controller
    local radio_state toggle_label options selection
    radio_state=$( nmcli radio wifi )
    toggle_label="󰖩  Enable Wi-Fi"
    [[ "$radio_state" == "enabled" ]] && toggle_label="󰖪  Disable Wi-Fi"

    # menu
    options=( "$toggle_label" "󱛃  Add Network" "󱛅  Remove Network" "󱚾  Saved Networks" "  Share Network" )
    selection=$( printf "%s\n" "${options[@]}" | lekker-launcher -l "${#options[@]}" -p "Network") || exit 0
    case "${selection#*  }" in
        "${toggle_label#*  }") toggle_wifi "$radio_state" ;;
        "Add Network") add ;;
        "Remove Network") remove ;;
        "Saved Networks") saved ;;
        "Share Network") share ;;
        *) exit 1 ;;
    esac
}

menu
