# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "#(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# xdg
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DOWNLOAD_DIR="$HOME/downloads"

# Home manager
source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh

# Environment
export EDITOR=nvim
export PAGER=bat

# miniconda
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1

# vim mode
export ZVM_VI_EDITOR=nvim
export ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

export LC_ALL=C.UTF-8

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="/opt/cuda/bin/:/opt/cuda/nsight_compute:/opt/cuda/nsight_systems/bin:$PATH"
# export PATH="/home/degra/coding/zig/zig-linux-x86_64-0.14.0-dev.1248+7bbbbf8ff/:$PATH"

# NPM
# export NPM_CONFIG_PREFIX=~/.npm-global
# export PATH=$PATH:~/.npm-global/bin

# QT
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_ENABLE_HIGHDPI_SCALING=1

export CUDA_PATH="/opt/cuda"
export NVCC_PREPEND_FLAGS='-ccbin /opt/cuda/bin'

# glow.yazi
export CLICOLOR_FORCE=1

# Plugins
# zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit ice lucid wait'0'; zinit light joshskidmore/zsh-fzf-history-search
zinit light chisui/zsh-nix-shell
zinit light undg/zsh-nvm-lazy-load
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode
zinit light ziglang/shell-completions

# Aliases
alias vim=nvim
alias chad='NVIM_APPNAME=nvim-chad nvim'

alias l='eza --icons=auto -l'
alias ls='eza --icons=auto'
alias la='eza --icons=auto -la'
alias lar='eza --icons=auto -la -R'
alias tp='trash-put'
alias cd='z'
alias zq='zoxide query -i'
alias ..='z ..'
alias ...='z ...'
alias ta='tmux attach'
alias f='yazi'
alias c='clear'

## Zellij
alias za='zellij a'
alias zr='zellij run -- '
alias zrf='zellij run -f --'

# Git
alias gits='git status'
alias gitc='git commit'

# Load completions
autoload -U compinit && compinit
bindkey '^ ' autosuggest-accept

# bindkey -e
# bindkey '^p' history-search-backward
# bindkey '^n' history-search-forward


# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# fzf
eval "$(fzf --zsh)"

# zoxide
eval "$(zoxide init zsh)"

# lazy_load_nvm() {
#   # unset -f node nvm
#   export NVM_DIR=~/.nvm
#   [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
#   [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# }
#
# npm() {
#   lazy_load_nvm
#   npm $@
# }
#
# node() {
#   lazy_load_nvm
#   node $@
# }
#
# nvm() {
#   lazy_load_nvm
#   nvm $@
# }


# prompt
eval "$(starship init zsh)"

# direnv
eval "$(direnv hook zsh)"

# eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# atuin
# . "$HOME/.atuin/bin/env"
# export ATUIN_NOBIND="true"
# eval "$(atuin init zsh)"
# bindkey '^r' atuin-search-viins
# bindkey '^r' atuin-search-vicmd

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

