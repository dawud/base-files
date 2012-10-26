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
#       /etc/profile.d/1777fix.sh: sourced by /etc/profile.
#
#       The latest version as installed by the Cygwin Setup program can
#       always be found at /etc/defaults/etc/profile.d/1777fix.sh
#
#       Modifying this file directly will prevent updating it automatically.

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
      cnt=$((cnt + 1))
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
