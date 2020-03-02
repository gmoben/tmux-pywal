#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# tmux bind-key T run-shell "$CURRENT_DIR/scripts/tmux_list_plugins.sh"

# python $CURRENT_DIR/convert.py

source $HOME/.cache/wal/colors.sh

TP=$HOME/.tmux/plugins/tmux-themepack
colors="$TP/src/powerline/_colors/wal.tmuxsh"

[[ -f $colors ]] && rm $colors

cat << EOF >> $colors
set -goq @powerline-color-main-1 "${color1}"
set -goq @powerline-color-main-2 "${foreground}"
set -goq @powerline-color-main-3 "${color4}"
EOF

themes=( "block" "default" "double" )
for i in "${themes[@]}"; do
    path="src/powerline/$i/wal.tmuxtheme"
    [[ ! -f "$TP/$path" ]] && cp {$CURRENT_DIR,$TP}/$path
    echo {$TP,$CURRENT_DIR}/$path
done

make -C $TP
