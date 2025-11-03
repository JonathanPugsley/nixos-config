#! /usr/bin/env bash
# pomodoro timer

CONFIGS=("50/10" "25/5" "1/1")
UPDATE_INTERVAL=1

cleanup() {
    echo "" > /tmp/timer
    notify-send "Timer Shutting Down"
    exit 0
}

trap cleanup SIGHUP SIGINT SIGQUIT SIGABRT SIGTERM

timer() {
    local mode=$1
    local duration=$2
    local repetition=$3

    total_seconds=$(( duration * 60 ))
    while [ "$total_seconds" -gt 0 ]; do
        MIN=$(printf "%02d" "$((total_seconds / 60))")
        SEC=$(printf "%02d" "$((total_seconds % 60))")
        echo " $mode | $MIN:$SEC | $repetition/$REPETITIONS " > /tmp/timer
        sleep "$UPDATE_INTERVAL"
        total_seconds=$((total_seconds - UPDATE_INTERVAL))
    done
}

# check for double instances
mapfile -t INSTANCES < <(pgrep -f /run/current-system/sw/bin/Timer)
if [[ ${#INSTANCES[@]} -gt 1 ]]; then
    kill -TERM "$INSTANCES"
fi

# select parameters
INTERVAL=$( printf "%s\n" "${CONFIGS[@]}" | wofi -dj -L "${#CONFIGS[@]}" ) || exit 0
case "$INTERVAL" in
    "50/10") FOCUS=50; REST=10 ;;
    "25/5") FOCUS=25; REST=5 ;;
    "1/1") FOCUS=1; REST=1 ;;
    *) exit 1
esac

REPETITIONS=$( echo "Cancel" | wofi --prompt="Number of Repetitions" --dmenu -L 1)
[[ "$REPETITIONS" =~ ^[0-9]+$ ]] || exit 0

# run timers
for ((i=1; i<=REPETITIONS; i++)); do
    notify-send "Starting focus for $FOCUS minutes"
    timer "Focus" "$FOCUS" "$i"
    notify-send "Starting rest for $REST minutes"
    timer "Rest" "$REST" "$i"
done
notify-send "$INTERVAL Pomodoro timer completed! ($REPETITIONS repetitions)" "Go take a break"

# finish with cleanup
cleanup
