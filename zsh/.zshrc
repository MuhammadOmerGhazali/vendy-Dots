# Add user configurations here
# For HyDE to not touch your beloved configurations,
# we added 2 files to the project structure:
# 1. ~/.hyde.zshrc - for customizing the shell related hyde configurations
# 2. ~/.zshenv - for updating the zsh environment variables handled by HyDE // this will be modified across updates





# Updated config

# --- Environment Variables ---
# Standard XDG directories for a clean home folder
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DESKTOP_DIR="${XDG_DESKTOP_DIR:-$HOME/Desktop}"
export XDG_DOWNLOAD_DIR="${XDG_DOWNLOAD_DIR:-$HOME/Downloads}"
export XDG_TEMPLATES_DIR="${XDG_TEMPLATES_DIR:-$HOME/Templates}"
export XDG_PUBLICSHARE_DIR="${XDG_PUBLICSHARE_DIR:-$HOME/Public}"
export XDG_DOCUMENTS_DIR="${XDG_DOCUMENTS_DIR:-$HOME/Documents}"
export XDG_MUSIC_DIR="${XDG_MUSIC_DIR:-$HOME/Music}"
export XDG_PICTURES_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}"
export XDG_VIDEOS_DIR="${XDG_VIDEOS_DIR:-$HOME/Videos}"
export LESSHISTFILE="${LESSHISTFILE:-/tmp/less-hist}"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export SCREENRC="$XDG_CONFIG_HOME/screen/screenrc"

# Your custom exports from .zshrc
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
export MOZ_USE_XINPUT2=1

# --- Oh-My-Zsh Setup ---
# Find Oh-My-Zsh installation
zsh_paths=(
    "$HOME/.oh-my-zsh"
    "/usr/local/share/oh-my-zsh"
    "/usr/share/oh-my-zsh"
)
for zsh_path in "${zsh_paths[@]}"; do
    [[ -d $zsh_path ]] && export ZSH=$zsh_path && break
done

# Load Oh-My-Zsh if available
[[ -r $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh

# --- Plugins ---
# Plugins from .hyde.zshrc and HyDE defaults, deduplicated
plugins=(
    sudo
    git
    zsh-256color
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
)
# Deduplicate plugins (just in case)
plugins=($(printf "%s\n" "${plugins[@]}" | sort -u))

# --- Powerlevel10k Theme ---
# Load Powerlevel10k theme if available
P10K_THEME=${P10K_THEME:-/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme}
[[ -r $P10K_THEME ]] && source $P10K_THEME

# Load Powerlevel10k configuration if it exists
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# --- Startup Commands ---
# From .hyde.zshrc, executed before prompt
fastfetch

# --- Aliases ---
# Standard aliases from .zshenv, kept if tools are available
if [[ -x "$(which eza)" ]]; then
    alias l='eza -lh --icons=auto'
    alias ll='eza -lha --icons=auto --sort=name --group-directories-first'
    alias ld='eza -lhD --icons=auto'
    alias lt='eza --icons=auto --tree'
fi

alias c='clear'
alias vc='code'
alias fastfetch='fastfetch --logo-type kitty'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias mkdir='mkdir -p'