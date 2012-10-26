#!/usr/bin/sh
#
#   Copyright information
#
#       Copyright (C) 2010-2012 David Sastre Medina <d.sastre.medina@gmail.com>
#
#   License
#
#       Permission to use, copy, modify, and/or distribute this
#       software for any purpose with or without fee is hereby
#       granted, provided that the above copyright notice and this
#       permission notice appear in all copies.
#
#       THE SOFTWARE IS PROVIDED "AS IS" AND ISC DISCLAIMS ALL WARRANTIES
#       WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
#       MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL ISC BE LIABLE FOR ANY
#       SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
#       WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
#       ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
#       OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
#       For more information, see <http://spdx.org/licenses/ISC>
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
