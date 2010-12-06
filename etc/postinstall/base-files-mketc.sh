#!/bin/sh
# base-files version 4.0-1

#--
# Create symbolic links from some /etc files to the Windows equivalents
#--

FILES="hosts protocols services networks"

OSNAME="$(/bin/uname -s)"
WINSYS32HOME="$(/bin/cygpath -S -w)"
WINETC="${WINSYS32HOME}\\drivers\\etc"

if [ ! -d "${WINETC}" ]; then
  /usr/bin/printf "Directory ${WINETC} does not exist; exiting\n" >&2
  /usr/bin/printf "If directory name is garbage you need to update your cygwin package\n" >&2
  exit 1
fi

for mketc in ${FILES}
do
  if [ ! -e "/etc/${mketc}" -a ! -L "/etc/${mketc}" ]
  then
    # Windows only uses the first 8 characters
    WFILE="${WINETC}\\$(expr substr "${mketc}" 1 8)"
    /usr/bin/ln -s -v "${WFILE}" "/etc/${mketc}"
  fi
done

exit 0
