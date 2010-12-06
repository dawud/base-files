#!/bin/sh
# base-files version 4.0-1

MANIFEST="/etc/preremove/base-files-manifest.lst"

[ -f ${MANIFEST} ] || (/usr/bin/printf "Unable to find manifest file.\n" && exit 1)

/usr/bin/printf "*** Removing unmodified base files.\n"
/usr/bin/printf "*** These will be updated by the postinstall script.\n"
/usr/bin/printf "*** Please wait.\n"

while read f; do
  /usr/bin/cmp -s "/${f}" "/etc/defaults/${f}" && \
    (/usr/bin/printf "/${f} hasn't been modified, it will be updated.\n" ; \
     /usr/bin/rm -f "/${f}")
done < ${MANIFEST}

exit 0
