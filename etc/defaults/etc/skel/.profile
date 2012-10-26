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
