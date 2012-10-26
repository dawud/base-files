#!/bin/sh
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
