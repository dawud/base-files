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
  echo "Directory ${WINETC} does not exist; exiting" >&2
  echo "If directory name is garbage you need to update your cygwin package" >&2
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

/usr/bin/chmod 1777 /tmp 2>/dev/null

exit 0
