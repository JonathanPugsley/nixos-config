#! /usr/bin/env bash
# tmux session manager
# ---
# highly inspired by primeagean's "sessionizer", and sylvan franklin's "session dispensary"

CONFIG_FILE="$HOME/.config/tmux/tmux-session-manager.conf"

USAGE="Usage: tmux-session-manager [OPTIONS]
\nOptions:
  -h,--help\t\t\t Display this help message

  -f [file path]\t\t File path to open a session in
"

launch_session() {
    local session_path session_name cmd
    session_path="${SELECTED%/}"
    session_name=$( basename "$session_path" | tr . _ )

    if [[ ! -d "$session_path" ]]; then
        echo "tmux-session-manager: $session_path cannot be found"
        exit 1
    fi

    cmd="attach"
    [[ -n "$TMUX" ]] && cmd="switchc"

    if ! tmux has-session -t "$session_name" 2>/dev/null; then
        tmux new -c "$session_path" -ds "$session_name"
    fi
    tmux "$cmd" -t "$session_name"
}

picker() {
    [[ ! -f "$CONFIG_FILE" ]] && echo "No Config File Found" && exit 1
    source "$CONFIG_FILE"
    SELECTED=$( fd . "${DIRS[@]}" --type=dir --max-depth=1 --full-path |  fzf )
    [[ ! "$SELECTED" ]] && exit 0
}

parse_args() {
    [[ "$#" -gt 2 ]] && echo -e "$USAGE" && exit 1
    if [[ "$#" -eq 0 ]]; then
        picker && return
    else
        case "$1" in
            -f) SELECTED=$2 ;;
            -h|--help) echo -e "$USAGE" && exit 0 ;;
            *) echo -e "USAGE" && exit 1 ;;
        esac
    fi
}

parse_args "$@"
launch_session
