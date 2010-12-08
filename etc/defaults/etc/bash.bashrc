# base-files version 4.0-1
# /etc/bash.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/bash.bashrc

# Modifying /etc/bash.bashrc directly will prevent
# setup from updating it.

# System-wide .bashrc file

# If not running interactively, don't do anything
[ -z "${PS1}" ] && return

# TMP and TEMP are defined in the Windows environment.  Leaving
# them set to the default Windows temporary directory can have
# unexpected consequences.
unset TMP
unset TEMP
# Alternatively, set them to the Cygwin temporary directory
# or to any other tmp directory of your choice
# export TMP="/tmp"
# export TEMP="/tmp"

# Set a HOSTNAME variable
export HOSTNAME=$(hostname)

# Set a default prompt of: user@host and current_directory
PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '

# Uncomment to use the terminal colours set in DIR_COLORS
# eval "$(dircolors -b /etc/DIR_COLORS)"

# Run the profile.d scripts for bash/sh
# Note that these are supplied by separate packages
# Ascending alphanumerical order enforced
[ -d "/etc/profile.d" ] && while read f; do
  [ -f "${f}" ] && . "${f}"
done <<- EOF
$(/bin/find -L /etc/profile.d -type f -iname '*.sh' | LC_ALL=C sort)
EOF
