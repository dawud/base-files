#!/bin/tcsh
# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# base-files version 4.1-1

# /etc/profile.d/1777fix.csh: sourced by /etc/profile.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/profile.d/1777fix.csh

# Modifying /etc/profile.d/1777fix.csh directly will prevent
# setup from updating it.

# Fix a problem introduced by older versions of setup.exe
# Read comments in /etc/profile.d/1777fix.sh for more information.

set GUARDFILE = "/etc/.1777fix"

if ( ! -f "${GUARDFILE}" ) then
  /bin/bash /etc/profile.d/1777fix.sh
endif
