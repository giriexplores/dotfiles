HISTFILE=~/.zsh_history #history file for zsh
HISTSIZE=5000 #history size
SAVEHIST=$HISTSIZE #same size as history size

# The following lines were added by compinstall
zstyle :compinstall filename '/home/giri/.zshrc'

autoload -U compinit && compinit

# main options
setopt auto_cd
setopt interactive_comments # allows comments in interactive shell
setopt vi # allows to use vim motions in prompt
setopt hist_ignore_space # remove command from history that is prepended with space
setopt hist_ignore_dups # doe not enter command lines in history if they are duplicates of previous event 
setopt share_history # share history across multiple sessions
setopt inc_append_history # commands are added to $HISTFILE incrementally (as soon as they are entered), rather than waiting until the shell exits
setopt hist_find_no_dups # ignores duplicates when searching history

# aliases
alias ls='ls --color'
alias l='ls'
alias ll='ls -lh'
alias la='ls -lA'

alias e='exit'

alias grep='grep --color'
alias diff='diff --color'

alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Properly rendering NerdFonts
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# always start tmux
if command -v tmux &>/dev/null && [ -n "$PS1" ] &&
    [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] &&
    [ -z "$TMUX" ]; then

    if tmux ls &>/dev/null; then
        tmux attach
    else
        tmux new-session -s dev
    fi
fi

# starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# nvm (node version manager)
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# load plugins only if they are available
[[ -f ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
    source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ -f ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ]] && \
    source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

[[ -f ~/.config/zsh/zsh-you-should-use/you-should-use.plugin.zsh ]] && \
    source ~/.config/zsh/zsh-you-should-use/you-should-use.plugin.zsh


# zsh-history-substring-search options
# search history in insert mode(default)
bindkey -M viins '^[k' history-substring-search-up 
bindkey -M viins '^[j' history-substring-search-down 

#search history in normal/command mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# syntax highlighting, it's recommended to source it at the end of file
[[ -f ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# pnpm
export PNPM_HOME="/home/giri/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

. "$HOME/.local/bin/env"

# bun completions
[ -s "/home/giri/.bun/_bun" ] && source "/home/giri/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Docker completions
FPATH="$HOME/.docker/completions:$FPATH"
autoload -Uz compinit
compinit
