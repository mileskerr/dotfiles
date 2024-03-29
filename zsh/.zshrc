
###########HISTORY###########

HISTFILE="$XDG_STATE_HOME/zsh/zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS

###########AUTOCOMPLETION###########

autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)

###########VI MODE###########

export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

bindkey -v

bindkey -v '^?' backward-delete-char

bindkey -M vicmd "j" vi-backward-char
bindkey -M vicmd "l" up-line-or-history
bindkey -M vicmd "k" down-line-or-history
bindkey -M vicmd ";" vi-forward-char

bindkey -M menuselect "j" vi-backward-char
bindkey -M menuselect "l" up-line-or-history
bindkey -M menuselect "k" down-line-or-history
bindkey -M menuselect ";" vi-forward-char

###########PLUGINS###########

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

export FZF_DEFAULT_COMMAND="fd -H -I -t f -E '.cache'"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_CTRL_T_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'
export FZF_ALT_C_COMMAND="find -type d"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

###########PROMPT###########

#colors for ps1
S1="%{$(xcol -fg sel_fg -bg sel_bg)%}"
S1INV="%{$(xcol -bg background -fg sel_bg)%}"
RESET="%{$(tput sgr0)%}"

#square ps1:
export PS1="${S1}%~${S1INV}$RESET "

#gpg tty
export GPG_TTY=$(tty)

###########ALIASES###########

source "$XDG_CONFIG_HOME/sh/aliases"

