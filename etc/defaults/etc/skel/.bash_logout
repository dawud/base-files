# base-files version 4.0-1
# ~/.bash_logout: executed by bash(1) when login shell exits.

# To pick up the latest recommended .bash_profile content,
# look in /etc/defaults/etc/skel/.bash_logout

# Modifying /etc/defaults/skel/.bash_logout directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bash_logout) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear ] && /usr/bin/clear
fi
