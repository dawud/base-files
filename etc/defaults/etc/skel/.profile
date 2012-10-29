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
