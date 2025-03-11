# ZSH configuration
export ZSH="$HOME/.oh-my-zsh"

# Theme and plugin settings
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(gitfast brew kubectl kube-ps1 zsh-autosuggestions zsh-syntax-highlighting)

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH options
ZSH_DISABLE_COMPFIX="true"
ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"

# Git completion performance settings
zstyle ':completion:*' accept-exact-dirs true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=2
zstyle ':completion:*' group-name ''

# History configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
# Immediately append to history file:
setopt INC_APPEND_HISTORY
# Record timestamp in history:
setopt EXTENDED_HISTORY
# Expire duplicate entries first when trimming history:
setopt HIST_EXPIRE_DUPS_FIRST
# Dont record an entry that was just recorded again:
setopt HIST_IGNORE_DUPS
# Delete old recorded entry if new entry is a duplicate:
setopt HIST_IGNORE_ALL_DUPS
# Do not display a line previously found:
setopt HIST_FIND_NO_DUPS
# Dont record an entry starting with a space:
setopt HIST_IGNORE_SPACE
# Dont write duplicate entries in the history file:
setopt HIST_SAVE_NO_DUPS
# Share history between all sessions:
setopt SHARE_HISTORY


# Environment variables
export LANG=en_US.UTF-8
export DOCKER_BUILDKIT=1

# Add custom paths only if they exist
[[ -d "$HOME/.cargo/bin" ]] && export PATH="$PATH:$HOME/.cargo/bin"
[[ -d "/usr/local/opt/openssl@1.1/bin" ]] && export PATH="$PATH:/usr/local/opt/openssl@1.1/bin"
[[ -d "$HOME/.local/bin" ]] && export PATH="$PATH:$HOME/.local/bin"

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Source custom performance settings
[[ -f ~/.zsh_custom ]] && source ~/.zsh_custom

# Load custom configuration files
for file in ~/.{aliases,functions,path,dockerfunc,extra,exports}; do
    [[ -r "$file" && -f "$file" ]] && source "$file"
done
unset file

# Environment-specific configurations
if [[ -z "$CODESPACES" ]]; then
    # Local environment
    [[ -f ~/.local-config ]] && source ~/.local-config
else
    # Codespaces environment
    [[ -f ~/.codespaces-config ]] && source ~/.codespaces-config
fi

# Node.js environment setup - only if nvm directory exists
if [[ -d "$HOME/.nvm" ]]; then
    export NVM_DIR="$HOME/.nvm"
    [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
    [[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
    command -v nvm &>/dev/null && nvm use default &>/dev/null
fi

# NPM completion - only if npm is installed
command -v npm &>/dev/null && source <(npm completion)

# Load iTerm2 shell integration if available
[[ -e "${HOME}/.iterm2_shell_integration.zsh" ]] && source "${HOME}/.iterm2_shell_integration.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
