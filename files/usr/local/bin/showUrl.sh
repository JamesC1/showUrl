#!/bin/bash
#
# This is an attempt to capture requests to open a browser,
# and redirect them into a terminal window for human decision.
#
# It is run twice; once from the attempted application launching,
# and then separately, with ARGS defined.

if test -v ARGS; then
  echo Someone asked for these parameters
  echo
  echo "$ARGS"
  echo
  echo
  pstree.x11 -l -s $$   # waits for the user to press return
#  echo
#  read -u 2 -p "Press ENTER to close" junk
  exit
fi

ARGS="$*" /etc/alternatives/x-terminal-emulator -e "$0"

