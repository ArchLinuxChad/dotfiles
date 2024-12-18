#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\w@\u] > '

# alias for clear
alias cls="clear"

alias ls="exa -aal"

# add to path
export PATH="/home/$USER/.local/bin:$PATH"

# alias for git
alias addup="git add ."
alias commit="git commit -m"
alias push="git push -u origin main"

# bind for zi
bind "'C-b':'zi<CR>'"

# alias for trash
alias rm="trash -v"

# run fastfetch
fastfetch

eval "$(zoxide init bash)"
