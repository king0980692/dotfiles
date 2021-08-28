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

# between quotation marks is the tool output for LS_COLORS
# REF : https://geoff.greer.fm/lscolors/
export LS_COLORS="di=0:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


# Then, source plugins and add commands to $PATH
zplug load

bindkey '^ ' autosuggest-accept

