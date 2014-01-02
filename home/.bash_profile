# save the variable DBUS_SESSION_BUS_ADDRESS to file ~/.DBUS-temp
set | grep DBUS_SESSION_BUS_ADDRESS > ~/.DBUS_temp

# [alias] group
# These aliases should be laid in file .bash_aliases
# File .bash_aliases would be sourced by .bashrc
alias grep='grep --color=auto'
alias rm='rm -i'
