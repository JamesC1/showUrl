#!/usr/bin/bash
#
# Soft-link the contents of ../files into the various places,
# in case that's enough to make them work.
#

set -e
set -x

file =

makeLink() {
  ln -s "$(realpath $PWD/$file)" /$file
}

deleteLink() {
  # dummy version that shows undeleted links
  ls -l /$file
}

case "$0" in
  */install*)
    CMD=makeLink;;

  */uninstall*)
    CMD=deleteLink;;

  *)
    echo >&2 "ERROR: called as "$0", which has no defined behaviour."
    exit 1;;
esac

cd ../files

find . -type f | while read file; do
  $CMD
done

