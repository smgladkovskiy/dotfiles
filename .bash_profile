keys=( '/Users/smgladkovskiy/.ssh/smgladkovskiy/id_rsa' '/Users/smgladkovskiy/.ssh/smgladkovskiy/id_ed25519' '/Users/smgladkovskiy/.ssh/tmc/id_rsa' )

for key in "${keys[@]}"
do
  ssh-add -l | grep -q `ssh-keygen -lf $(find $key)  | awk '{print $2}'` || ssh-add $key
done

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Make ls use colors
export CLICOLOR=1

# define colors
C_DEFAULT="\[\033[m\]"
C_WHITE="\[\033[1m\]"
C_BLACK="\[\033[30m\]"
C_RED="\[\033[31m\]"
C_GREEN="\[\033[32m\]"
C_YELLOW="\[\033[33m\]"
C_BLUE="\[\033[34m\]"
C_PURPLE="\[\033[35m\]"
C_CYAN="\[\033[36m\]"
C_LIGHTGRAY="\[\033[37m\]"
C_DARKGRAY="\[\033[1;30m\]"
C_LIGHTRED="\[\033[1;31m\]"
C_LIGHTGREEN="\[\033[1;32m\]"
C_LIGHTYELLOW="\[\033[1;33m\]"
C_LIGHTBLUE="\[\033[1;34m\]"
C_LIGHTPURPLE="\[\033[1;35m\]"
C_LIGHTCYAN="\[\033[1;36m\]"
C_BG_BLACK="\[\033[40m\]"
C_BG_RED="\[\033[41m\]"
C_BG_GREEN="\[\033[42m\]"
C_BG_YELLOW="\[\033[43m\]"
C_BG_BLUE="\[\033[44m\]"
C_BG_PURPLE="\[\033[45m\]"
C_BG_CYAN="\[\033[46m\]"
C_BG_LIGHTGRAY="\[\033[47m\]"

# set your prompt
export PS1="$C_LIGHTGREEN\u$C_LIGHTGRAY@$C_BLUE\h$C_DARKGRAY:$C_LIGHTYELLOW\w$C_LIGHTGRAY\$$C_DEFAULT "
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH="~/bin:$PATH"

# include in .bashrc if it exists
if [ -d $HOME/.bashrc.d ]; then
  for file in $HOME/.bashrc.d/*; do
    source $file
  done
fi

export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
