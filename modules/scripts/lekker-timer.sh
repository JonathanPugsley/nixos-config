#! /usr/bin/env bash
# timer - lekker utility

TIMER_MODES=( "Countdown" "Pomodoro" "Stopwatch" )
WARN="Stop Current Timer?"
LOCK_FILE="/tmp/timer.pid"
TIMER_FILE="/tmp/timer"

timer_end() {
    # graceful end
    local silent=$1
    echo "" > "$TIMER_FILE"
    [[ "$silent" -eq 1 ]] || notify-send "Timer Shutting Down"
    exit 0
}

trap timer_end SIGHUP SIGINT SIGQUIT SIGABRT SIGTERM

timer() {
    local label=$1
    local duration=$2
    local repetition=$3
    local total_reps=$4
    rep_counter=""

    # repetition counter > 1
    [[ "$total_reps" -gt 1 ]] && rep_counter=" $repetition/$total_reps"

    # timer main loop
    total_seconds=$(( duration * 60 ))
    while [[ "$total_seconds" -gt 0 ]]; do
        min=$( printf "%02d" "$(( total_seconds / 60 ))" )
        sec=$( printf "%02d" "$(( total_seconds % 60 ))" )
        echo "{\"alt\": \"$label\", \"text\": \"$min:$sec$rep_counter\"}" > "$TIMER_FILE"
        sleep 1
        total_seconds=$(( total_seconds - 1 ))
    done
}

stopwatch() {
    total_seconds=0
    while true; do
        min=$( printf "%02d" "$(( total_seconds / 60 ))" )
        sec=$( printf "%02d" "$(( total_seconds % 60 ))" )
        echo "{\"alt\": \"stopwatch\", \"text\": \"$min:$sec\"}" > "$TIMER_FILE"
        sleep 1
        total_seconds=$(( total_seconds + 1 ))
    done
}

countdown() {
    menu_height=$( lekker-menu-height "" )
    minutes=$( echo "Cancel" | wofi -d -H "$menu_height" -p "Minutes" ) || exit 0
    [[ "$minutes" =~ ^[0-9]+$ ]] || exit 0

    notify-send "Timer" "Starting countdown for $minutes minutes!"
    timer "countdown" "$minutes" "0" "0"
    notify-send "Timer" "Countdown timer completed!"
}

pomodoro() {
    pomo_configs=( "Custom" "50/10" "25/5" )
    menu_height=$( lekker-menu-height "${pomo_configs[@]}" )
    menu_height_single=$( lekker-menu-height "" )
    interval=$( printf "%s\n" "${pomo_configs[@]}" | wofi -dj -H "$menu_height" ) || exit 0
    if [[ "$interval" =~ ([0-9]+)\/([0-9]+) ]]; then
        focus=$( echo "$interval" | awk -F'/' '{print $1}' )
        rest=$( echo "$interval" | awk -F'/' '{print $2}' )
    else
        # custom interval input
        focus=$( echo "Cancel" | wofi -d -H "$menu_height_single" -p "Minutes" ) || exit 0
        [[ "$focus" =~ ^[0-9]+$ ]] || exit 0
        rest=$( echo "Cancel" | wofi -d -H "$menu_height_single" -p "Rest" ) || exit 0
        [[ "$rest" =~ ^[0-9]+$ ]] || exit 0
    fi

    # repetition input
    repetitions=$( echo "Cancel" | wofi -d -H "$menu_height_single" -p "Number of Repetitions" ) || exit 0
    [[ "$repetitions" =~ ^[0-9]+$ ]] || exit 0

    # run timer loop
    for (( i=1; i<=repetitions; i++ )); do
        notify-send "Starting focus for $focus minutes"
        timer "pomodoro-focus" "$focus" "$i" "$repetitions"
        notify-send "Starting rest for $rest minutes"
        timer "pomodoro-rest" "$rest" "$i" "$repetitions"
    done
    notify-send "$interval Pomodoro timer completed! ($repetitions repetitions)" "Go take a break"
}

menu() {
    # handle already running timer
    if [[ "$TIMER_RUNNING" -eq 1 ]]; then
        menu_height=$( lekker-menu-height "" "" )
        NEW=$( printf "New Timer\nCancel" | wofi -dE -H "$menu_height" -p "$WARN" ) || exit 0
        [[ "$NEW" == "New Timer" ]] || exit 0
        kill "$PID" && wait "$PID" 2>/dev/null
    fi

    # save current pid to lockfile
    echo "$$" > "$LOCK_FILE"
    menu_height=$( lekker-menu-height "${TIMER_MODES[@]}" )
    mode=$( printf "%s\n" "${TIMER_MODES[@]}" | wofi -djE -H "$menu_height" ) || exit 0
    case "$mode" in
        "Countdown") countdown ;;
        "Pomodoro") pomodoro ;;
        "Stopwatch") stopwatch ;;
        *) exit 1 ;;
    esac
}

TIMER_RUNNING=0

# check and manage currently running timers
if [[ -f "$LOCK_FILE" ]]; then
    PID=$( cat "$LOCK_FILE" )
    [ -n "$PID" ] && ps -p "$PID" > /dev/null && TIMER_RUNNING=1
fi

# handle commands
case "$1" in
    "stop") [[ $TIMER_RUNNING -eq 1 ]] && kill "$PID" && wait "$PID" 2>/dev/null ;;
    "menu") menu ;;
    *) exit 1 ;;
esac

# finish with cleanup
timer_end "1"
