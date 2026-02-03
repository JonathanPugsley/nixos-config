#! /usr/bin/env bash
# main lekker menu

ENTRIES=( "  Apps" "  Capture" "  Timer" "  Toggle" "  Manage" "  Nixpkgs" "  Symbols" "  About" "  System" )

about() {
    abt_cmd="xdg-terminal-exec -e $SHELL -c 'fastfetch; echo -n \"Press any key to exit... \" && read -sr -k 1 ; exit'"
    lekker-launch-floating-window "$abt_cmd" -W 980 -H 600
}

pkg_search() {
    ns="nix-search-tv print | fzf -i --preview 'nix-search-tv preview {}' --scheme history --layout reverse"
    pkg_cmd="xdg-terminal-exec -e $SHELL -c \"$ns\""
    lekker-launch-floating-window "$pkg_cmd"
}

selection=$( printf "%s\n" "${ENTRIES[@]}" | lekker-launcher -l "${#ENTRIES[@]}" -p "Lekker" ) || exit 0
case "${selection#*  }" in
    "Apps") rofi -show drun ;;
    "Capture") lekker-menu-capture ;;
    "Timer") lekker-timer menu ;;
    "Toggle") lekker-menu-toggle ;;
    "Manage") lekker-menu-manage ;;
    "Nixpkgs") pkg_search ;;
    "Symbols") lekker-menu-symbols ;;
    "About")  about ;;
    "System") lekker-menu-system ;;
    *) exit 1 ;;
esac
