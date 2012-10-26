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
