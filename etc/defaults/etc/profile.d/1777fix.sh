#!/bin/bash
# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# base-files version 4.1-1

# /etc/profile.d/1777fix.sh: sourced by /etc/profile.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/profile.d/1777fix.sh

# Modifying /etc/profile.d/1777fix.sh directly will prevent
# setup from updating it.

# Fix a problem introduced by older versions of setup.exe
# Directories with 1777 permissions were erroneously created
# with 777 inheritable default permissions.  This is a security
# problem for non-Cygwin apps using these folders.  This is
# especially tragic in case of /tmp.

GUARDFILE="/etc/.1777fix"
DIRLIST=(/home /tmp /usr/tmp /var/log /var/run)

if [ ! -f "${GUARDFILE}" ]
then
  cnt=0
  success=0
  for file in ${DIRLIST[@]}
  do
    # We test if the default group or other permissions are rwx.
    # If so, it's dangerous and highly likely that these are still
    # the permissions set by setup.exe
    case $(getfacl "${file}") in
    *default:group::rwx* | *default:other:rwx* )
      cnt=$((${cnt} + 1))
      setfacl -m d:g::r-x,d:o:r-x "${file}" 2>/dev/null \
      && success=$((${success} + 1))
      ;;
    esac
  done
  # If no file needed treatment, or if all setfacl calls succeeded,
  # create the guard file.
  [ ${cnt} -eq  ${success} ] && touch "${GUARDFILE}"
  unset cnt success file
fi
