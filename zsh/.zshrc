# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export PATH=$PATH:~/Code/bin

# Path to your oh-my-zsh installation.
  export ZSH="/home/tunnel/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
#ZSH_THEME="lambda"
DEFAULT_USER="tunnel"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="false"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="false"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  autojump
  history
  sudo
  sprunge
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Transfer.sh Alias
# Authors:
#   Remco Verhoef <remco@dutchcoders.io>
#
#curl --version 2>&1 > /dev/null
#if [ $? -ne 0 ]; then
#  echo "Could not find curl."
#  return 1
#fi
#
#transfer() {
#    # check arguments
#    if [ $# -eq 0 ];
#    then
#        echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
#        return 1
#    fi
#
#    # get temporarily filename, output is written to this file show progress can be showed
#    tmpfile=$( mktemp -t transferXXX )
#
#    # upload stdin or file
#    file=$1
#
#    if tty -s;
#    then
#        basefile=$(basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
#
#        if [ ! -e $file ];
#        then
#            echo "File $file doesn't exists."
#            return 1
#        fi
#
#        if [ -d $file ];
#        then
#            # zip directory and transfer
#            zipfile=$( mktemp -t transferXXX.zip )
#            cd $(dirname $file) && zip -r -q - $(basename $file) >> $zipfile
#            curl --progress-bar --upload-file "$zipfile" "https://transfer.sh/$basefile.zip" >> $tmpfile
#            rm -f $zipfile
#        else
#            # transfer file
#            curl --progress-bar --upload-file "$file" "https://transfer.sh/$basefile" >> $tmpfile
#        fi
#    else
#        # transfer pipe
#        curl --progress-bar --upload-file "-" "https://transfer.sh/$file" >> $tmpfile
#    fi
#
#    # cat output link
#    cat $tmpfile
#
#    # cleanup
#    rm -f $tmpfile
#}

# My Specific Aliases
# Set default editor
export EDITOR=vim
export VISUAL=vim
#alias pico='edit'
#alias nano='edit'

# Modified commands
alias d='dict'
alias c='clear'
#alias night='night-mode'
#alias day='day-mode'
alias please='sudo $(fc -ln -1)'
alias red='redshift -l 45.523062:-122.676482'
alias upgradeall='apt update && apt upgrade -y'
alias diskspace='du -S | sort -n -r |more'
alias wal='wal -e -t'
alias uke='uke-chords'
alias mood='mplayer /home/tunnel/dotfiles/mood/0.m4a -loop 0 -volume 50'
alias home='cd ~/'
alias dot='cd ~/Github/dotfiles'
alias gs='git status'
# alias drive='cd /media/tunnel/Finn'

drive () {
    cd /media/tunnel/Finn/"$1"
}

school () {
    cd /media/tunnel/Finn/School/Southridge/9th\ Grade/"$1"
}

mdpdf () {
    pandoc "$1" -o "$1".pdf
    transfer "$1".pdf
    rm "$1".pdf
}

mdprev () {
    pandoc "$1" -o tmp.html
    surf tmp.html
    rm tmp.html
}

mdprevpdf () {
    pandoc "$1" -o tmp.pdf
    atril tmp.pdf
    rm tmp.pdf
}

# ls aliases
alias la='ls -Alh'
alias ls='ls --color=always'

# chmod commands
alias mx='sudo chmod +x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Package Managers
alias apt='sudo apt'
alias apt-get='sudo apt'
alias aptitude='sudo aptitude'
alias pacman='sudo pacman'
alias yaourt='sudo yaourt'

# Extract Function
extract () {
	for archive in $*; do
		if [ -f $archive ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf $archive    ;;
				*.tar.gz)    tar xvzf $archive    ;;
				*.bz2)       bunzip2 $archive     ;;
				*.rar)       rar x $archive       ;;
				*.gz)        gunzip $archive      ;;
				*.tar)       tar xvf $archive     ;;
				*.tbz2)      tar xvjf $archive    ;;
				*.tgz)       tar xvzf $archive    ;;
				*.zip)       unzip $archive       ;;
				*.Z)         uncompress $archive  ;;
				*.7z)        7z x $archive        ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

# Show the current distribution
distribution ()
{
	local dtype
	# Assume unknown
	dtype="unknown"

	# First test against Fedora / RHEL / CentOS / generic Redhat derivative
	if [ -r /etc/rc.d/init.d/functions ]; then
		source /etc/rc.d/init.d/functions
		[ zz`type -t passed 2>/dev/null` == "zzfunction" ] && dtype="redhat"

	# Then test against SUSE (must be after Redhat,
	# I've seen rc.status on Ubuntu I think? TODO: Recheck that)
	elif [ -r /etc/rc.status ]; then
		source /etc/rc.status
		[ zz`type -t rc_reset 2>/dev/null` == "zzfunction" ] && dtype="suse"

	# Then test against Debian, Ubuntu and friends
	elif [ -r /lib/lsb/init-functions ]; then
		source /lib/lsb/init-functions
		[ zz`type -t log_begin_msg 2>/dev/null` == "zzfunction" ] && dtype="debian"

	# Then test against Gentoo
	elif [ -r /etc/init.d/functions.sh ]; then
		source /etc/init.d/functions.sh
		[ zz`type -t ebegin 2>/dev/null` == "zzfunction" ] && dtype="gentoo"

	# For Mandriva we currently just test if /etc/mandriva-release exists
	# and isn't empty (TODO: Find a better way :)
	elif [ -s /etc/mandriva-release ]; then
		dtype="mandriva"

	# For Slackware we currently just test if /etc/slackware-version exists
	elif [ -s /etc/slackware-version ]; then
		dtype="slackware"

	fi
	echo $dtype
}

# Show the current version of the operating system
ver ()
{
	local dtype
	dtype=$(distribution)

	if [ $dtype == "redhat" ]; then
		if [ -s /etc/redhat-release ]; then
			cat /etc/redhat-release && uname -a
		else
			cat /etc/issue && uname -a
		fi
	elif [ $dtype == "suse" ]; then
		cat /etc/SuSE-release
	elif [ $dtype == "debian" ]; then
		lsb_release -a
		# sudo cat /etc/issue && sudo cat /etc/issue.net && sudo cat /etc/lsb_release && sudo cat /etc/os-release # Linux Mint option 2
	elif [ $dtype == "gentoo" ]; then
		cat /etc/gentoo-release
	elif [ $dtype == "mandriva" ]; then
		cat /etc/mandriva-release
	elif [ $dtype == "slackware" ]; then
		cat /etc/slackware-version
	else
		if [ -s /etc/issue ]; then
			cat /etc/issue
		else
			echo "Error: Unknown distribution"
			exit 1
		fi
	fi
}
