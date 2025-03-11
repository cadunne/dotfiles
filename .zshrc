# ZSH configuration
export ZSH="$HOME/.oh-my-zsh"
export ZSHRC="$HOME/.zshrc"

# Theme and plugin settings
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git brew kubectl kube-ps1 zsh-autosuggestions zsh-syntax-highlighting)

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH options
ZSH_DISABLE_COMPFIX="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

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
# Execute commands using history (e.g.: using !$) immediately:
unsetopt HIST_VERIFY

# Environment variables
export LANG=en_US.UTF-8
export DOCKER_BUILDKIT=1
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.cargo/bin:/usr/local/opt/openssl@1.1/bin:$HOME/.local/bin"

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Uncomment to add kube settings to prompt
# USING_KUBE=1
if [[ -n "$USING_KUBE" ]]; then
    RPROMPT=$RPROMPT'$(kube_ps1)'
fi

# Load custom configuration files
for file in ~/.{aliases,functions,path,dockerfunc,extra,exports}; do
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        source "$file"
    fi
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

# Node.js environment setup
export NVM_DIR="$HOME/.nvm"
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
    source "$NVM_DIR/nvm.sh"  # Load NVM
    source "$NVM_DIR/bash_completion"  # Load NVM bash completion
    nvm use default &>/dev/null
fi

# NPM completion
which npm &>/dev/null && source <(npm completion)

# Load poetry if installed
[[ -d "$HOME/.poetry/bin" ]] && export PATH="$HOME/.poetry/bin:$PATH"

# Load asdf if installed
[[ -f /usr/local/opt/asdf/libexec/asdf.sh ]] && source /usr/local/opt/asdf/libexec/asdf.sh

# Load iTerm2 shell integration if available
[[ -e "${HOME}/.iterm2_shell_integration.zsh" ]] && source "${HOME}/.iterm2_shell_integration.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
