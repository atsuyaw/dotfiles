#!/bin/sh
# [origin] https://gist.github.com/norcalli/81fa49055767d84986637151237f7dbd
fuser -sk -SIGINT "$0"
test "$1" = off && exit 0
[ "${FLOCKER}" != "$0" ] && exec env FLOCKER="$0" flock -enx "$0" "$0" "$@" || :
exec wf-recorder -c gif -r 10 -g "$(slurp)" -filter_complex "[0:v] fps=10,scale=640:-1,split [a][b];[a] palettegen [p];[b][p] paletteuse=dither=floyd_steinberg" -f /home/atsuyaw/Videos/Captures/$(date +"%Y-%m-%d_%H%M%S").gif
