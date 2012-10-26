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
#       Executed by the login shells. NOTE: This file is not read by
#       bash(1) if ~/.bash_profile or ~/.bash_login exists.
#
#       The latest version as installed by the Cygwin Setup program can
#       always be found at /etc/defaults/etc/skel/.profile
#
#       Modifying /etc/skel/.profile directly will prevent
#       updating it autmatically.
#
#       The copy in your $HOME directory is yours, please feel free to
#       customise it to create a shell environment to your liking. If
#       you feel a change would be benifitial to all, please feel free
#       to send a patch to the cygwin mailing list.

# Set user-defined locale
export LANG=$(locale -uU)

# if running bash
if [ -n "${BASH_VERSION}" ]; then
  if [ -f "${HOME}/.bashrc" ]; then
    source "${HOME}/.bashrc"
  fi
fi
