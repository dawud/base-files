#!/usr/bin/sh
#
#   Copyright information
#
#       Copyright (C) 2010-2012 David Sastre Medina <d.sastre.medina@gmail.com>
#
#   License
#
#       This program is free software; you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation; either version 3 of the License, or
#       (at your option) any later version.
#
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#       GNU General Public License for more details.
#
#       You should have received a copy of the GNU General Public License
#       along with this program. If not, see <http://www.gnu.org/licenses/>.
#
#    Description
#
#       base-files version 4.1-2
#
#       Create symbolic links from some /etc files to the Windows equivalents
#       Set permissions to /tmp directory

FILES="hosts protocols services networks"
OSNAME="$(/usr/bin/uname -s)"
WINSYS32HOME="$(/usr/bin/cygpath -S -w)"
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
