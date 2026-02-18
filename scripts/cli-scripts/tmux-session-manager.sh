#! /usr/bin/env bash
# tmux session manager v0.2.0
# ---
# highly inspired by primeagean's "sessionizer", and sylvan franklin's "session dispensary"
# dependencies: bash, tmux, fd

CONFIG_PATH="$HOME/.config/tmux"
CONFIG_BASENAME="tmux-session-manager.conf"
CONFIG_FILE="$CONFIG_PATH/$CONFIG_BASENAME"

COMMAND=""

SESSION_PATH=""
SESSION_NAME=""
SESSION_TARGET=""

USAGE="\
usage: tmux-session-manager <command> [flags] [args...|--help]
launch, close and navigate tmux sessions from directory lists

commands:
\tclose                             \t→ Close a tmux session
\tlaunch                            \t→ Launch a tmux session. If ran with no flags, will use fzf on directories
\t                                  \t  specified in the config file, and display to user

flags:
\t-c,--config <path_to_file>        \t→ Specify config file path. Filename should be specified if not default name
\t-p,--session-path <path_to_file>  \t→ Open or close a session at specified directory path
\t-s,--session-name <name>          \t→ Override automatic session name on launch only
\t-t,--session-target <session_name>\t→ Open or close a session based on session name. Directory with provided
\t                                  \t  session name must present in the config file. See '-c|--config'
\t-h,--help:                        \t→ Display help message

default config file can be found at: ~/.config/tmux/tmux.conf\
"

usage() {
    echo -e "$USAGE"
}

handle_error() {
    local error_msg="$1"
    echo -e "error: $error_msg"
    echo "see 'tmux-session-manager --help' for more information"
    exit 1
}

update_config_file() {
    local path="$1/$CONFIG_BASENAME"
    [[ $( basename "$1" ) == *.conf ]] && path="$1"
    CONFIG_FILE="$path"
    echo "using config file '$CONFIG_FILE'"
}

set_session_name() {
    local name="$1"
    SESSION_NAME="$name"
}

set_session_path() {
    local path="$1"
    [ ! -d "$path" ] && handle_error "session path '$path' not found"
    SESSION_PATH="$path"
}

set_session_target() {
    local target="$1"
    SESSION_TARGET="$target"
}

close_target() {
    if tmux has-session -t "$SESSION_TARGET" 2>/dev/null; then
        tmux kill-session -t "$SESSION_TARGET"
    else
        handle_error "session name \"$SESSION_TARGET\" not found "
    fi
}

close_fzf() {
    SESSION_TARGET=$( tmux ls -F "#{session_name}" | fzf ) || exit 0
}

close_session() {
    if [ -n "$SESSION_TARGET" ]; then
        close_target
    else
        close_fzf && close_target
    fi
}

launch_fzf() {
    SESSION_PATH=$( fd . "${DIRS[@]}" --type=dir --max-depth=1 --full-path |  fzf ) || exit 0
}

launch_path() {
    local cmd running_wd conflict_error_msg
    [ -n "$TMUX" ] && cmd="switchc" || cmd="attach"
    [ -z "$SESSION_NAME" ] && SESSION_NAME=$( basename "$SESSION_PATH" | tr . _ )

    if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
        running_wd=$( tmux display-message -p -t "$SESSION_NAME":0.0 '#{pane_current_path}' )
        if [[ "$running_wd" != "${SESSION_PATH%/}" ]]; then
            conflict_error_msg="session \"$SESSION_NAME\" already running at \"$running_wd\"."
            conflict_error_msg+=" Please specify a new session name, or close the running session"
            handle_error "$conflict_error_msg"
        fi
    else
        tmux new -c "${SESSION_PATH%/}" -ds "$SESSION_NAME"
    fi
    tmux "$cmd" -t "$SESSION_NAME"
}

launch_target() {
    local matches
    mapfile -t matches < <(fd "$SESSION_TARGET" "${DIRS[@]}" --type=dir --max-depth=1 --full-path)
    case "${#matches[@]}" in
        0)
            echo "tmux-session-manager: no matches found for \"$SESSION_TARGET\" "
            exit 0 ;;
        1)
            SESSION_PATH="${matches[0]}" ;;
        *)
            SESSION_PATH=$( printf "%s\n" "${matches[@]}" | fzf ) || exit 0
    esac
}

launch_session() {
    local path_empty target_empty

    [ ! -f "$CONFIG_FILE" ] && handle_error "config file '$CONFIG_FILE' not found"
    source "$CONFIG_FILE"

    path_empty=$( [ -z "$SESSION_PATH" ] && echo 1 || echo 0 )
    target_empty=$( [ -z "$SESSION_TARGET" ] && echo 1 || echo 0 )

    case "$path_empty$target_empty" in
        # both args provided
        00) handle_error "specify only one of '--path' '--target'" ;;
        # path provided
        01) launch_path ;;
        # target provided
        10) launch_target && launch_path ;;
        # no args passed - fzf
        11) launch_fzf && launch_path ;;
        # this state should never be reached
        *) handle_error "unexpected state occurred in launch command" ;;
    esac
}

parse_args() {
    while [ "$#" -gt 0 ]; do
        case "$1" in
            close|launch) COMMAND="${1}_session" && shift 1 ;;
            -c|--config) update_config_file "$2" && shift 2 ;;
            -p|--session-path) set_session_path "$2" && shift 2 ;;
            -s|--session-name) set_session_name "$2" && shift 2 ;;
            -t|--session-target) set_session_target "$2" && shift 2 ;;
            -h|--help) usage && exit 0 ;;
            *) handle_error "unrecognised command '$1'" ;;
        esac
    done

    [ -z "$COMMAND" ] && handle_error "no command provided"
}

parse_args "$@"
"$COMMAND"
