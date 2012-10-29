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
