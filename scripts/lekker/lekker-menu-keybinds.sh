#! /usr/bin/env bash
# display hyprland keybinds

dynamic_bindings() {
    hyprctl -j binds | jq -r '.[] | {modmask, key, keycode, description, dispatcher, arg} | "\(.modmask),\(.key)@\(.keycode),\(.description),\(.dispatcher),\(.arg)"' |
    sed -r \
        -e 's/null//' \
        -e 's/@0//' \
        -e 's/^0,/,/' \
        -e 's/^1,/SHIFT,/' \
        -e 's/^4,/CTRL,/' \
        -e 's/^5,/SHIFT + CTRL,/' \
        -e 's/^8,/ALT,/' \
        -e 's/^9,/SHIFT + ALT,/' \
        -e 's/^12,/CTRL + ALT,/' \
        -e 's/^13,/SHIFT + CTRL + ALT,/' \
        -e 's/^64,/SUPER,/' \
        -e 's/^65,/SUPER + SHIFT,/' \
        -e 's/^68,/SUPER + CTRL,/' \
        -e 's/^69,/SUPER + SHIFT + CTRL,/' \
        -e 's/^72,/SUPER + ALT,/' \
        -e 's/^73,/SUPER + SHIFT + ALT,/' \
        -e 's/^76,/SUPER + CTRL + ALT,/' \
        -e 's/^77,/SUPER + SHIFT + CTRL + ALT,/' \
        -e 's/mouse:272,/LMB,/' \
        -e 's/mouse:273,/RMB,/' \
        -e 's/mouse:274,/MMB,/' |
    awk -F, '
        # skip XF86 keys with no modifier
        $2 ~ /^XF86/ && $1 == "" { next } { print }
    '
}

parse_bindings() {
    awk -F, ' {
        # Combine the modifier and key (first two fields)
        key_combo = $1 " + " $2;

        # Clean up: strip leading "+" if present, trim spaces
        gsub(/^[ \t]*\+?[ \t]*/, "", key_combo);
        gsub(/[ \t]+$/, "", key_combo);

        # Use description, if set
        action = $3;

        if (action == "") {
            # Reconstruct the command from the remaining fields
            for (i = 4; i <= NF; i++) {
                action = action $i (i < NF ? "," : "");
            }

            # Clean up trailing commas, remove leading "exec, ", and trim
            sub(/,$/, "", action);
            gsub(/(^|,)[[:space:]]*exec[[:space:]]*,?/, "", action);
            gsub(/^[ \t]+|[ \t]+$/, "", action);
            gsub(/[ \t]+/, " ", key_combo);  # Collapse multiple spaces to one

            # Escape XML entities
            gsub(/&/, "\\&amp;", action);
            gsub(/</, "\\&lt;", action);
            gsub(/>/, "\\&gt;", action);
            gsub(/"/, "\\&quot;", action);
            gsub(/'"'"'/, "\\&apos;", action);
        }

        if (action != "") {
            printf "%-35s → %s\n", key_combo, action;
        }
    }'
}

prioritize_entries() {
  awk '
  {
    line = $0
    prio = 50
    if (match(line, /Terminal/)) prio = 0
    if (match(line, /Browser/) && !match(line, /Browser[[:space:]]*\(/)) prio = 1
    if (match(line, /File Manager/))  prio = 2
    if (match(line, /Run Apps/))  prio = 3
    if (match(line, /Lekker Menu/))  prio = 4
    if (match(line, /Power Menu/))  prio = 5
    if (match(line, /Clipboard/))  prio = 6
    if (match(line, /Fullscreen/))  prio = 7
    if (match(line, /Kill Window/))  prio = 8
    if (match(line, /Force Kill Window/))  prio = 9
    if (match(line, /Toggle Window Float/))  prio = 10
    if (match(line, /Screenshot/))  prio = 11
    if (match(line, /Notes/))  prio = 12
    if (match(line, /Music/))  prio = 13
    if (match(line, /Steam/))  prio = 14
    if (match(line, /Discord/))  prio = 15
    if (match(line, /Window Focus/))  prio = 16
    if (match(line, /Window Move/))  prio = 17
    if (match(line, /Workspace/))  prio = 18
    if (match(line, /Move to Workspace/))  prio = 19
    if (match(line, /Keybinds Menu/))  prio = 20
    # print "priority<TAB>line"
    printf "%d\t%s\n", prio, line
  }' |
  sort -k1,1n -k2,2 |
  cut -f2-
}

dynamic_bindings |
sort -u |
parse_bindings |
prioritize_entries |
lekker-launcher  -l 14 -p "Keybinds" -w 700
