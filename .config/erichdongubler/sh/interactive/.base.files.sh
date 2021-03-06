case "$DOTFILES_OS" in
	"darwin")
		export CLICOLOR=1
		alias ll='ls -l --time-style='"'+%d-%m-%Y %H:%M:%S'"
		alias la='ls -A'
		alias l.='ls -d .!(|.)'
		;;
	*)
		eval $(dircolors -b)
		alias ls='ls --color=auto'
		alias ll='ls -l --color=auto --time-style='"'+%d-%m-%Y %H:%M:%S'"
		alias la='ls --color=auto -A'
		alias l.='ls --color=auto -d .!(|.)'
		alias rm='rm -Iv --one-file-system'
		;;
esac

function swap() {
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE $2
}

alias grep='grep --color=auto'
