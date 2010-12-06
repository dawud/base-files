#!/bin/sh
# base-files version 4.0-1

MANIFEST="/etc/preremove/base-files-manifest.lst"

[ -f ${MANIFEST} ] || (printf "Unable to find manifest file\n" && exit 0)

while read f; do
  fSrc="/etc/defaults/${f}"
  fDest="/${f}"
  if [ ! -e ${fDest} -a ! -L ${fDest} ]; then
    /usr/bin/printf "Using the default version of ${fDest} (${fSrc})\n"
	  /usr/bin/mkdir -p $(dirname ${fDest})
    /usr/bin/touch ${fDest}
    /usr/bin/cp ${fSrc} ${fDest}
  else
    printf "${fDest} is already in existance, not overwriting.\n"
  fi
done < ${MANIFEST}

