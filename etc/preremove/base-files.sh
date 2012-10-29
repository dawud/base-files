#!/bin/sh
#
#   Copyright information
#
#       Copyright (C) 2010-2012 David Sastre Medina <d.sastre.medina@gmail.com>
#
#   License
#
#       Permission to use, copy, modify, and/or distribute this software for any
#       purpose with or without fee is hereby granted, provided that the above
#       copyright notice and this permission notice appear in all copies.
#
#       THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
#       WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
#       MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
#       ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
#       WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
#       ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
#       OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
#       For more information, see <http://spdx.org/licenses/ISC>
#
#    Description
#
#       base-files version 4.1-2

MANIFEST="/etc/preremove/base-files-manifest.lst"

[ -f ${MANIFEST} ] || (echo "Unable to find manifest file." && exit 1)

echo "*** Removing unmodified base files."
echo "*** These will be updated by the postinstall script."
echo "*** Please wait."

while read f; do
  /usr/bin/cmp -s "/${f}" "/etc/defaults/${f}" && \
    (echo "/${f} hasn't been modified, it will be updated." ; \
     /usr/bin/rm -f "/${f}")
done < ${MANIFEST}

exit 0
