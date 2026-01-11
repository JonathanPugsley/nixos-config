#! /usr/bin/env bash
# lekker audio menu

MIXER_COMMAND="xdg-terminal-exec -e $SHELL -c wiremix"

set_sink_source() {
    # fetch list of available (sinks/sources) and IDs
    [[ "$1" == "Sink" ]] && awk_pattern='/ ├─ Sinks:/{flag=1; next} / ├─ Sources:/{flag=0} flag'
    [[ "$1" == "Source" ]] && awk_pattern='/ ├─ Sources:/{flag=1; next} / ├─ Filters:/{flag=0} flag'
    readarray -t devices < <(wpctl status -k |
        awk "$awk_pattern" |
        sed 's/│//' |
        sed 's/^[[:space:]]*//' |
        sed 's/\[vol: [^]]*\]//g' |
        sed 's/^[[:space:]]*//;s/[[:space:]]*$//;s/[[:space:]]\+/ /g' |
        sed '/^$/d')

    echo "${devices[@]}"

    # extract source names to make menu look cleaner
    declare -a names
    for item in "${devices[@]}"; do
        names+=( "${item#*. }" )
    done

    selected_device=$( printf "%s\n" "${names[@]}" | lekker-launcher -l "${#names[@]}" -p "$1") || exit 0

    # find corresponding source ID
    for i in "${!devices[@]}"; do
        if [[ "${devices[$i]}" == *"$selected_device"* ]]; then
            id=${devices[$i]%%.*}
            id=${id//* /}
            break
        fi
    done

    wpctl set-default "$id"
    notify-send -a "lekker" "Lekker Audio" "Default ${1,,} set to: $selected_device"
}

# menu
OPTIONS=( "  Change Audio Sink" "  Change Audio Source" "  Open Volume Mixer" "  Open Pipewire Graph" )
SEL=$( printf "%s\n" "${OPTIONS[@]}" | lekker-launcher -l "${#OPTIONS[@]}" -p "Audio" ) || exit 0
case "${SEL#*  }" in
    "Change Audio Sink") set_sink_source Sink;;
    "Change Audio Source") set_sink_source Source;;
    "Open Volume Mixer") lekker-launch-floating-window "$MIXER_COMMAND";;
    "Open Pipewire Graph") lekker-launch-floating-window qpwgraph;;
    *) exit 1;;
esac
