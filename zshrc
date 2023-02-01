# /etc/zsh/zshrc: system-wide .zshrc file for zsh(1).
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin

READNULLCMD=${PAGER:-/usr/bin/pager}

# An array to note missing features to ease diagnosis in case of problems.
typeset -ga debian_missing_features

if [[ -z "$DEBIAN_PREVENT_KEYBOARD_CHANGES" ]] &&
   [[ "$TERM" != 'emacs' ]]
then

    typeset -A key
    key=(
        BackSpace  "${terminfo[kbs]}"
        Home       "${terminfo[khome]}"
        End        "${terminfo[kend]}"
        Insert     "${terminfo[kich1]}"
        Delete     "${terminfo[kdch1]}"
        Up         "${terminfo[kcuu1]}"
        Down       "${terminfo[kcud1]}"
        Left       "${terminfo[kcub1]}"
        Right      "${terminfo[kcuf1]}"
        PageUp     "${terminfo[kpp]}"
        PageDown   "${terminfo[knp]}"
    )

    function bind2maps () {
        local i sequence widget
        local -a maps

        while [[ "$1" != "--" ]]; do
            maps+=( "$1" )
            shift
        done
        shift

        sequence="${key[$1]}"
        widget="$2"

        [[ -z "$sequence" ]] && return 1

        for i in "${maps[@]}"; do
            bindkey -M "$i" "$sequence" "$widget"
        done
    }

    bind2maps emacs             -- BackSpace   backward-delete-char
    bind2maps       viins       -- BackSpace   vi-backward-delete-char
    bind2maps             vicmd -- BackSpace   vi-backward-char
    bind2maps emacs             -- Home        beginning-of-line
    bind2maps       viins vicmd -- Home        vi-beginning-of-line
    bind2maps emacs             -- End         end-of-line
    bind2maps       viins vicmd -- End         vi-end-of-line
    bind2maps emacs viins       -- Insert      overwrite-mode
    bind2maps             vicmd -- Insert      vi-insert
    bind2maps emacs             -- Delete      delete-char
    bind2maps       viins vicmd -- Delete      vi-delete-char
    bind2maps emacs viins vicmd -- Up          up-line-or-history
    bind2maps emacs viins vicmd -- Down        down-line-or-history
    bind2maps emacs             -- Left        backward-char
    bind2maps       viins vicmd -- Left        vi-backward-char
    bind2maps emacs             -- Right       forward-char
    bind2maps       viins vicmd -- Right       vi-forward-char
    #bind2maps       viins vicmd -- '^[.'       insert-last-word

bindkey -M viins '^[.' insert-last-word
bindkey -M vicmd '^[.' insert-last-word

    # Make sure the terminal is in application mode, when zle is
    # active. Only then are the values from $terminfo valid.
    if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
        function zle-line-init () {
            emulate -L zsh
            printf '%s' ${terminfo[smkx]}
        }
        function zle-line-finish () {
            emulate -L zsh
            printf '%s' ${terminfo[rmkx]}
        }
        zle -N zle-line-init
        zle -N zle-line-finish
    else
        for i in {s,r}mkx; do
            (( ${+terminfo[$i]} )) || debian_missing_features+=($i)
        done
        unset i
    fi

    unfunction bind2maps

fi # [[ -z "$DEBIAN_PREVENT_KEYBOARD_CHANGES" ]] && [[ "$TERM" != 'emacs' ]]

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin \
                                           /usr/local/bin  \
                                           /usr/sbin       \
                                           /usr/bin        \
                                           /sbin           \
                                           /bin            \
                                           /usr/X11R6/bin

(( ${+aliases[run-help]} )) && unalias run-help
autoload -Uz run-help

# If you don't want compinit called here, place the line
# skip_global_compinit=1
# in your $ZDOTDIR/.zshenv or $ZDOTDIR/.zprofile
if [[ -z "$skip_global_compinit" ]]; then
  autoload -U compinit
  compinit
fi

bindkey -v

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias dh='dirs -v'
alias h='history -250'
alias install='sudo apt-get install '
alias hexdump='od -A x -t x1z '
alias bingo="fc -ln -1 >> .bingos"
alias psc='ps xawf -eo pid,user,cgroup,args'
alias xargs="xargs -d '\n'"
alias grep="grep --color -P"
alias fhg="fh | grep"
alias fhx="fh | xargs grep"
alias sctl="sudo systemctl"
alias nctl="sudo netctl"
alias jctl=journalctl
alias jclear="sudo journalctl --flush; sudo journalctl --rotate; sudo journalctl -m --vacuum-time=1s"
alias gog="git log --graph --all --reflog --pretty='%x09%h%x09%ad %C(cyan)%an%x09%C(yellow)%d%x09%Cgreen%s%Creset'"
alias cutt="cut -d ' ' -f"
alias hgd="hg diff -r 'ancestor(default,.)'"
alias xo=xdg-open
alias t=". ~/.local/bin/t"

giffn () {
  git diff -wU$1 "$2^" $2 $3
}

giff () {
  git diff -wU20 "$1^" $1 $2
}

giff0 () {
  git diff -U0 "$1^" $1
}

glame () {
  git log $1 | grep -Po "^[^ \t]*" | while read C; do git diff -U0 "$C^" $C | grep $2 && echo $C;done
}

recent () {
  git log --name-only --format= -n 1000000 --author=Adrian | awk '!a[$1]++'
}

recenthg () {
  hg log -l 100 -u Adrian -T '{files}\n' | tr ' ' '\n' | sed '/^$/d' | awk '!a[$1]++'
}

revhg () {
  hg log -T '{node}\n' -b default -k "Merge with TRENT-$1" | tac | while read C; do echo; echo "============================== $C ========================="; hg diff -U15 --pager=never -wc $C ; done
}

revgit () {
    git log --format="%h" --grep "Merge branch 'TRENT-$1" | tac | while read C; do echo -e "\n##############################################################\n"; git --no-pager show -m $C; done
}

mergesBy () {
  gog | grep -C1 $1 | grep "into 'master'" -B1 | grep 'tag: tv-' | sed 's/^[* |]*//' | cut -f 1 | tac
}

alias review=revgit

# dir-local history ...
setopt appendhistory autocd extendedglob notify autopushd pushdminus pushdsilent pushdtohome prompt_subst share_history hist_ignorealldups

export HISTGLOBAL=$HOME/.zsh_history
touch $HISTGLOBAL
export HISTSIZE=2000
export SAVEHIST=2000
export HISTROOT=$HOME/.hist
export EDITPR=vi

chpwd () {
    fc -A $HISTGLOBAL $HISTSIZE $SAVEHIST
    [ -d $HISTROOT/$PWD ] || mkdir -p $HISTROOT/$PWD
    export HISTFILE=$HISTROOT/$PWD/hist
    fc -p $HISTFILE $HISTSIZE $SAVEHIST
    touch $HISTFILE
}

zle -N chpwd
chpwd

#Prompt

autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
	colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
eval PR_BK_$color='%{$terminfo[bold]$bg[${(L)color}]%}'
eval PR_BK_LIGHT_$color='%{$bg[${(L)color}]%}'
(( count = $count + 1 ))
done
PR_NO_COLOUR="%{$terminfo[sgr0]%}"

function precmd() {
	local TERMWIDTH
	(( TERMWIDTH = ${COLUMNS} - 1 ))
	local LEFTWIDTH=${#${(%):-%n@%m:%~}}
	local RIGHTWIDTH=${#${(%):--%w%T}}
	local PADWIDTH
	(( PADWIDTH = ( ${TERMWIDTH} - ${LEFTWIDTH} - ${RIGHTWIDTH} ) / 2 ))
	PR_PAD=' '
	PR_PADDING="\${(l.(( $PADWIDTH )).. .)}"
  PR_TEMP=$PR_NO_COLOUR
  [[ $HOST = coal ]] && PR_TEMP=$PR_BLUE
}

PROMPT='%(!.$PR_WHITE$PR_BK_RED.$PR_TEMP$PR_BK_GREEN)%~${(e)PR_PADDING}%n@%m${(e)PR_PADDING} %w %T%E
%?|%! $PR_NO_COLOUR$([ -f /usr/share/sounds/popq.wav ] && aplay -q /usr/share/sounds/popq.wav &)'

PATH=~/.config/bin:~/.local/bin:~/bin:~/.cargo/bin:$PATH
export P4CONFIG=~/p4.conf
export PRINTER=`cat ~/.printer`
export JAVA_HOME=/usr/lib/jvm/default

ulimit -c unlimited

stty stop ''
stty start ''
stty -ixon
stty -ixoff

. $HOME/.nvm/nvm.sh

cat DOING

ffind() {
  DIR=${2:=.}
  REGEX=$1
  find $DIR -type f | xargs grep $REGEX
}

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix

# source /usr/share/nvm/init-nvm.sh
# source /home/ad/build/emsdk/emsdk_env.sh



[ -f "/home/ad/.ghcup/env" ] && source "/home/ad/.ghcup/env" # ghcup-env
 
alias n="nix-shell --command zsh haskell.nix"
alias t="nix-build nix/ci.nix -A tiko-tests.haskell --option sandbox false"
alias x=xdg-open

