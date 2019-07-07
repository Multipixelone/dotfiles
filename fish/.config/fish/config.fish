#
# config.fish
# Written by Multipixelone 2019-03-11
# Including functions, path changes, and other little bits I like to include to improve my shell
#

# Add to the path environment variable
#set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
#set -gx PATH ~/bin $PATH

# Add the function to make a backup of a file before editing it
function vimbak
    echo "You are making a copy of $1 before you open it. Press enter to continue."
    read nul
    cp $argv $argv.bak
    vim $argv
end

# Set editor
set -gx EDITOR vim
set -gx VISUAL vim

# Remove fish greeting
set fish_greeting

# Remove vi mode??
function fish_mode_prompt
end

# Install fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Add default aliases
alias upgradeall="sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y"
alias c="clear"
alias relaunch="/home/tunnel/.config/polybar/launch.sh"
#alias please="sudo $(fc -ln -1)"
alias diskspace="du -S | sort -n -r |more"
alias mood="mplayer /home/tunnel/dotfiles/mood/0.m4a -loop 0 -volume 50"
alias kahoot="cd /home/tunnel/Documents/Github/kahoot-tools; node /home/tunnel/Documents/Github/kahoot-tools/kahoot-tools.js"
alias mkdir="mkdir -pv"
alias cp="cp -rv"
alias mv="mv -v"
alias rm="rm -rv"
alias mount="mount | column -t"
alias gpu="prime-select query"
alias meminfo="free -g -l -t"
alias top="htop"

# Network Alias :)
alias ap="sudo create_ap wlx0013ef500f01 wlp2s0 merlin somestaydrywhileothersfeelthepain"

# Add git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gpull="git pull"
alias gpush="git push"

# Add network aliases
alias ping="ping -c 5"
alias fastping="ping -c 100 -s.2"
alias ports="netstat -tulanp"
alias wget="wget -c"

# Add ls aliases
#alias la="ls -lAhF --color=always"
#alias ls="ls --color=always"
#alias ls="colorls"
alias la="ls -lAhf --color=always"


# Color in less
alias less="less -R"

# Add chmod aliases
alias mx="sudo chmod +x"
alias 000="chmod -R 000"
alias 644="chmod -R 644"
alias 666='chmod -R 666'
alias 755="chmod -R 755"
alias 777="chmod -R 777"

# Add package manager commands
alias apt="sudo apt"
alias apt-get="sudo apt"
alias aptitude="sudo aptitude"
alias pacman="sudo pacman"
alias yaourt="yay"

# Add color to grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Add thefuck for command checking
#thefuck --alias | source
