#!/usr/bin/sh
# base-files version 4.0-1

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
