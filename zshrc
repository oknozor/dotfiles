# Zsh 

zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl true
zstyle :compinstall filename '/home/okno/.zshrc'
autoload -Uz compinit promptinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

# Antigen 
source /usr/share/zsh/share/antigen.zsh 

antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle tarruda/zsh-autosuggestions
antigen apply

# Editor
export VISUAL="vim"
[[ $- != *i* ]] && return

# Tilix
if [[ $TILIX_ID ]]; then
        source /etc/profile.d/vte.sh
fi

# Aliases
alias ll='ls -larth'
alias ls='ls --color=auto'
alias danette='yaourt -Suy --aur && yaourt -Qdt' 
alias nextcal='calcurse-caldav && calcurse' 

## Systemctl 
alias start='sudo systemctl start'
alias stop= 'sudo systemclt stop'
alias status='systemctl status'
alias restart='sudo systemctl restart'
alias jof='journalctl -u'
alias fjof='journalctl -fu'

## Multimedia 
alias music='ncmpcpp'

# Intellij Android emu fix 
export ANDROID_HOME=$HOME/android-intellij
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
LD_PRELOAD=`/usr/lib/libstdc++.so.6 /usr/lib/libgcc_s.so.1 /usr/lib/libxcb.so.1 /usr/lib/libgpg-error.so`
export PATH=$PATH:/opt/i3scripts
alias emu="$LD_PRELOAD $ANDROID_HOME/tools/emulator"

PROMPT='%F{214}%n%F{117}@%F{49}%m%f %F{229}%1~%F{207} $%f '

neofetch
