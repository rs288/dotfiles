# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Soporte para acentos
export LANG=es_MX.UTF-8

# LATEX PATH
export PATH=$PATH:/usr/local/texlive/2021/bin/x86_64-linux 
export PATH=$PATH:/usr/local/texlive/2021/texmf-dist/doc/man 
export PATH=$PATH:/usr/local/texlive/2021/texmf-dist/doc/info 

# Java PATH
export PATH=$PATH:/usr/local/lib/java/jdk-11.0.11/bin
export JAVA_HOME=/usr/local/lib/java/jdk-11.0.11

# Nodejs PATH
export PATH=/usr/local/lib/nodejs/node-v16.13.1-linux-x64/bin:$PATH

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.config/zsh/zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

## History command configuration
setopt APPEND_HISTORY                         # Add history
setopt EXTENDED_HISTORY                       # Add timestamps to history
setopt INC_APPEND_HISTORY                     # Incremental history  
setopt HIST_EXPIRE_DUPS_FIRST                 # Oldest duplicates are removed firstfirst
setopt HIST_IGNORE_ALL_DUPS                   # DO NOT store duplicates
setopt HIST_IGNORE_SPACE                      # Remove commands that start with a space from the history
setopt HIST_FIND_NO_DUPS                      # DOES NOT show duplicate commands
setopt HIST_REDUCE_BLANKS                     # Remove blanks in saved commands
setopt HIST_VERIFY                            # DOES NOT execute the command, it only displays it
setopt SHARE_HISTORY         			      # History shared between sessions

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Alias
alias scan='scanimage --format=png --mode Color --progress -y 280mm > '
alias multi= "xrandr --output LVDS1 --primary --auto --output HDMI1 --right-of LVDS1 --auto && pacmd set-card-profile 0 output:hdmi-stereo"
alias hdmi-off="xrandr --output HDMI1 --off --output LVDS1 --auto && pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo"
alias hdmi='xrandr --output HDMI1 --auto && pacmd set-card-profile 0 output:hdmi-stereo'
alias ls='ls --color=auto'
alias vi="nvim"
alias usb="sudo mount /dev/sdb1 usb && cd usb"
alias update-grub="grub-mkconfig -o /boot/grub/grub.cfg"
alias config='/usr/bin/git --git-dir=$HOME/usb/git/dotfiles --work-tree=$HOME'

source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/.p10k.zsh ]] || source ~/.config/.p10k.zsh
