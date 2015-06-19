# Sets up prompt behavior

# Source git scripts that enable tab completion and git branch on the prompt
if [ -f ~/.scripts/git-completion.bash ]; then
    source ~/.scripts/git-completion.bash
fi

if [ -f ~/.scripts/git-prompt.sh ]; then
    source ~/.scripts/git-prompt.sh
    enable_git=yes
fi

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    fi
fi

if [ -n "$color_prompt" ]; then

    # txtblk='\e[0;30m' # Black - Regular
    # txtred='\e[0;31m' # Red
    # txtgrn='\e[0;32m' # Green
    # txtylw='\e[0;33m' # Yellow
    # txtblu='' # Blue
    # txtpur='\e[0;35m' # Purple
    # txtcyn='\e[0;36m' # Cyan
    # txtwht='\e[0;37m' # White
    # bldblk='\e[1;30m' # Black - Bold
    # bldred='\e[1;31m' # Red
    # bldgrn='\e[1;32m' # Green
    # bldylw='\e[1;33m' # Yellow
    # bldblu='\e[1;34m' # Blue
    # bldpur='\e[1;35m' # Purple
    # bldcyn='\e[1;36m' # Cyan
    # bldwht='\e[1;37m' # White
    # unkblk='\e[4;30m' # Black - Underline
    # undred='\e[4;31m' # Red
    # undgrn='\e[4;32m' # Green
    # undylw='\e[4;33m' # Yellow
    # undblu='\e[4;34m' # Blue
    # undpur='\e[4;35m' # Purple
    # undcyn='\e[4;36m' # Cyan
    # undwht='\e[4;37m' # White
    # bakblk='\e[40m'   # Black - Background
    # bakred='\e[41m'   # Red
    # bakgrn='\e[42m'   # Green
    # bakylw='\e[43m'   # Yellow
    # bakblu='\e[44m'   # Blue
    # bakpur='\e[45m'   # Purple
    # bakcyn='\e[46m'   # Cyan
    # bakwht='\e[47m'   # White
    # txtrst='\e[0m'    # Text Reset

    if [ -n "$enable_git" ]; then
        PS1='\[\e[0;30m\][\[\e[0;34m\]\u\[\e[0;33m\]@\[\e[0;34m\]\h\[\e[0;30m\]] \[\e[0;32m\]\W\[\e[0;31m\]$(__git_ps1 " (%s)")\[\e[0;30m\]\$ '
    else
        PS1='\[\e[0;30m\][\[\e[0;34m\]\u\[\e[0;33m\]@\[\e[0;34m\]\h\[\e[0;30m\]] \[\e[0;32m\]\W\[\e[0;30m\]\$ '
    fi
else
    if [ -n "$enable_git" ]; then
        PS1='[\u@\h] \W$(__git_ps1 " (%s)")\$ '
    else
        PS1='[\u@\h] \W\$ '
    fi
fi
unset color_prompt force_color_prompt enable_git

