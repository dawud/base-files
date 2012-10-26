#   Copyright information
#
#       Copyright (C) 2010-2012 David Sastre Medina <d.sastre.medina@gmail.com>
#
#   License
#
#       Redistribution and use in source and binary forms, with or without
#       modification, are permitted provided that the following conditions
#       are met:
#
#       1. Redistributions of source code must retain the above copyright
#          notice, this list of conditions and the following disclaimer.
#       2. Redistributions in binary form must reproduce the above copyright
#          notice, this list of conditions and the following disclaimer in the
#          documentation and/or other materials provided with the distribution.
#
#       THIS SOFTWARE IS PROVIDED BY THE DEVELOPERS "AS IS" AND ANY EXPRESS OR
#       IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
#       OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
#       IN NO EVENT SHALL THE DEVELOPERS BE LIABLE FOR ANY DIRECT, INDIRECT,
#       INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
#       NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
#       DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
#       THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#       (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
#       THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#       For more information, see <http://spdx.org/licenses/BSD-2-Clause>
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
