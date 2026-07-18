#!/bin/sh
OUTPUT=HDMI-A-1
# flatpak-spawn needed to use kscreen-doctor
KSD="flatpak-spawn --host kscreen-doctor"

if [ "$1" = "undo" ]; then
    $KSD output.$OUTPUT.mode.3440x1440@100
    exit 0
fi

MODE="${SUNSHINE_CLIENT_WIDTH}x${SUNSHINE_CLIENT_HEIGHT}@${SUNSHINE_CLIENT_FPS}"
MHZ=$((SUNSHINE_CLIENT_FPS * 1000))

if ! $KSD -o | grep -q "$MODE"; then
    $KSD output.$OUTPUT.addCustomMode.$SUNSHINE_CLIENT_WIDTH.$SUNSHINE_CLIENT_HEIGHT.$MHZ.full
fi

$KSD output.$OUTPUT.mode.$MODE
exit 0
