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

MANIFEST="/etc/preremove/base-files-manifest.lst"

[ -f ${MANIFEST} ] || (echo "Unable to find manifest file." && exit 1)

while read f; do
  fSrc="/etc/defaults/${f}"
  fDest="/${f}"
  if [ ! -e ${fDest} -a ! -L ${fDest} ]; then
    echo "Using the default version of ${fDest} (${fSrc})"
    /usr/bin/mkdir -p $(dirname ${fDest})
    /usr/bin/touch ${fDest}
    /usr/bin/cp ${fSrc} ${fDest}
  else
    echo "${fDest} is already in existance, not overwriting."
  fi
done < ${MANIFEST}

exit 0
