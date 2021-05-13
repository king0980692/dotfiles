# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
source ~/.zplug/init.zsh

# Path to your oh-my-zsh installation.
export ZSH="/home/leon/.oh-my-zsh"

ZSH_THEME="jbergantine"


plugins=(git autojump)
source $ZSH/oh-my-zsh.sh

# zplug here ...

zplug "lib/completion", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "b4b4r07/enhancd", use:init.sh
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'zsh-users/zsh-autosuggestions'
zplug mafredri/zsh-async, from:github
#zplug ending




alias vim='nvim'
alias vi='nvim'
alias v='nvim'

alias pip=pip3
alias python=python3
export PATH=$PATH:~/.local/bin


alias dotfiles='/usr/bin/git --git-dir=/home/leon/.dotfiles/ --work-tree=/home/leon'



# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

export clicolor=1
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

# Then, source plugins and add commands to $PATH
zplug load
