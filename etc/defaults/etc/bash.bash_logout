# base-files version 4.0-4
# /etc/bash.bash_logout: executed by bash(1) when login shell exits.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/bash.bash_logout

# Modifying /etc/bash.bash_logout directly will prevent
# setup from updating it.

# System-wide bashrc file

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
  [ -x /usr/bin/clear ] && /usr/bin/clear
fi
