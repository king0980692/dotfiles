#zmodload zsh/zprof
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%F{1}(%b)%f'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST


#PROMPT='%F{2}%m%f:%F{30}%~%f %F{184}%n%f $ '
#PROMPT='%F{2}%m%f:%F{30} $ '

PROMPT='[%F{2}%m%f %F{magenta}@ %F{30}%~%f] ${vcs_info_msg_0_}
%F{184}%n%f # '


alias vim='vim'
alias nvim='nvim.appimage'
alias pip=pip3
alias python=python3

export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/bin

#source ~/.zplug/init.zsh
# zplug here ...
#zplug "lib/completion", from:oh-my-zsh
#zplug "b4b4r07/enhancd", use:init.sh
#zplug 'zsh-users/zsh-history-substring-search'
#zplug 'zsh-users/zsh-syntax-highlighting'
#zplug 'zsh-users/zsh-autosuggestions'
#zplug mafredri/zsh-async, from:github
#zplug ending


# Install plugins if there are plugins that have not been installed
#if ! zplug check --verbose; then
#    printf "Install? [y/N]: "
#    if read -q; then
#        echo; zplug install
#    fi
#fi
#
## Then, source plugins and add commands to $PATH
#zplug load --verbose

export clicolor=1
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz  _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \
    #zsh-users/zsh-completions \
    #zsh-users/zsh-history-substring-search \
    #zdharma/fast-syntax-highlighting

zinit ice lucid wait='0' atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

#zinit light zsh-users/zsh-completions
#zinit light zsh-users/zsh-history-substring-search
#zinit light zdharma/fast-syntax-highlighting

zinit wait lucid for \
  atload"_zsh_autosuggest_start" zsh-users/zsh-autosuggestions \
  #atinit"zpcompinit;zpcdreplay" zdharma-continuum/fast-syntax-highlighting

zinit wait lucid for \
  zsh-users/zsh-history-substring-search \
    atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    atload"unset 'FAST_HIGHLIGHT[chroma-perl]'" \
  zdharma-continuum/fast-syntax-highlighting

zinit light zsh-users/zsh-history-substring-search
  zmodload zsh/terminfo

bindkey '^ ' autosuggest-accept
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down
#bindkey "^[^[[D" backward-word
#bindkey "^[^[[C" forward-word

#zprof
