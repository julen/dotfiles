# ---- History
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE

# ---- Environment
eval "$(brew shellenv)"
eval "$(proto activate zsh)"

# ---- Completion
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

autoload -Uz compinit
# Only rebuild the completion cache once a day (keeps shell startup fast)
if [[ -n ${HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'    # case-insensitive matching
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"      # colorize completion list
zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete           # shift-tab cycles backwards

# ---- Prompt
autoload -Uz vcs_info
setopt PROMPT_SUBST

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '%F{green}+%f'
zstyle ':vcs_info:git:*' unstagedstr '%F{yellow}!%f'
zstyle ':vcs_info:git:*' formats ' %F{cyan}(%b)%f%c%u'
zstyle ':vcs_info:git:*' actionformats ' %F{cyan}(%b|%a%f%c%u'  # e.g. mid-rebase

precmd() { vcs_info }

CURRENT_PATH='%F{blue}%~%f'
NEWLINE=$'\n'
SYMBOL='%(?.%F{default}.%F{red})$%f'

PROMPT='${CURRENT_PATH}${vcs_info_msg_0_} ${NEWLINE}${SYMBOL} '


# ---- Domain-specific configs
for f in "$ZDOTDIR"/*.zsh(N); do source "$f"; done
