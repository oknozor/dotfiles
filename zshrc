# The following lines were added by compinstall

zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl true
zstyle :compinstall filename '/home/okno/.zshrc'
autoload -Uz compinit promptinit

# End of lines added by compinstall
# Lines configured by zsh-newuser-install

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

#______________________________________________#
# ___________________ ANTIGEN _________________#  

source /usr/share/zsh/share/antigen.zsh 

#Load the oh-my-zsh's library.
antigen use oh-my-zsh

#Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git

#Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

#antigen bundle rimraf/k
antigen bundle tarruda/zsh-autosuggestions

#Tell antigen that you're done.
antigen apply


#Editor
export VISUAL="vim"

#If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ______________________________________#
# _______________ Tilix _______________#
if [[ $TILIX_ID ]]; then
        source /etc/profile.d/vte.sh
fi

# ______________________________________#
# _______________ Aliases_______________#

alias ll='ls -larth'
alias ls='ls --color=auto'
alias danette='yaourt -Suy --aur && yaourt -Qdt' 
alias insult='echo Fuck you windows user!'
alias evil='emacs -nw'
alias nextcal='calcurse-caldav && calcurse' 
alias start='sudo systemctl start'
alias stop= 'sudo systemclt stop'
alias status='systemctl status'
alias restart='sudo systemctl restart'
alias jof='journalctl -u'
alias fjof='journalctl -fu'


#Intellij Android emu fix 
export ANDROID_HOME=$HOME/android-intellij
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
LD_PRELOAD=`/usr/lib/libstdc++.so.6 /usr/lib/libgcc_s.so.1 /usr/lib/libxcb.so.1 /usr/lib/libgpg-error.so`
export PATH=$PATH:/opt/i3scripts
alias emu="$LD_PRELOAD $ANDROID_HOME/tools/emulator"

PROMPT='%F{214}%n%F{117}@%F{49}%m%f %F{229}%1~%F{207} $%f '

#archey3 -c cyan

