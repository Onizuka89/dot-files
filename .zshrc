unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

export DISABLE_AUTO_TITLE=true

export EDITOR=$(which vim)
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
export ANDROID_HOME=$HOME/android-sdks
export FIREFOX_SDK_HOME=$HOME/Downloads/addon-sdk-1.16
export GRADLE_HOME=$HOME/Downloads/gradle-2.3
export GOPATH=$HOME/.go/
export GOROOT=/usr/local/opt/go/libexec
export GOBIN=$(which go)
export XML_CATALOG_FILES=/usr/local/etc/xml/catalog

. $HOME/.aliases
PYTHON_ROOT="/Library/Frameworks/Python.framework/Versions/2.7"
alias python27="${PYTHON_ROOT}/bin/python2.7"

source dnvm.sh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx git gradle ruby python pip rvm git-prompt npm gem brew mercurial tmuxinator pyenv)

# User configuration

export PATH="$HOME/.composer/vendor/bin:/usr/local/heroku/bin:$HOME/android-sdks/tools:$HOME/android-sdks/platform-tools:$GRADLE_HOME/bin:$HOME/downloads/apache-maven-3.1.1/bin:/usr/local/mysql/bin:$HOME/bin/scala-2.9.2/bin:$HOME/.npm/less/1.3.1/package/bin:$HOME/.npm/uglify-js/1.3.4/package/bin:$HOME/.npm/coffee-script/1.4.0/package/bin:/opt/local/bin:/usr/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/Applications/Server.app/Contents/ServerRoot/usr/bin:/Applications/Server.app/Contents/ServerRoot/usr/sbin:/usr/texbin:$HOME/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:$GOPATH/bin:$PATH"

export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:$PATH"

source $ZSH/oh-my-zsh.sh
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#
#  Not all terminals support this and, of those that do,
#  not all provide facilities to test the support, hence
#  the user should decide based on the terminal type.  Most
#  terminals  support the  colours  black,  red,  green,
#  yellow, blue, magenta, cyan and white, which can be set
#  by name.  In addition. default may be used to set the
#  terminal's default foreground colour.  Abbreviations
#  are allowed; b or bl selects black.  

precmd(){

    local exit_status=$?

    comment='
    if which ibam &> /dev/null; then
        IBAMSTAT="$(ibam)"
        if [[ ${IBAMSTAT[(f)(1)][(w)1]} =  "Battery" ]]; then
            BATTSTATE="$(ibam --percentbattery)"
            BATTPRCNT="${BATTSTATE[(f)1][(w)-2]}"
            BATTTIME="${BATTSTATE[(f)2][(w)-1]}"
            PR_BATTERY="Bat: ${BATTPRCNT}%% (${BATTTIME})"
            if [[ "${BATTPRCNT}" -lt 15 ]]; then
                PR_BATTERY=" ${BLUE_DIAMOND} ${PR_BRIGHT_RED}${PR_BATTERY}"
            elif [[ "${BATTPRCNT}" -lt 50 ]]; then
                PR_BATTERY=" ${BLUE_DIAMOND} ${PR_BRIGHT_YELLOW}${PR_BATTERY}"
            elif [[ "${BATTPRCNT}" -lt 100 ]]; then
                PR_BATTERY=" ${BLUE_DIAMOND} ${PR_BRIGHT_CYAN}${PR_BATTERY}${PR_RESET}"
            else
                PR_BATTERY=""
            fi
        else
            PR_BATTERY=""
        fi
    fi
    '

    if [[ -w $PWD ]]; then
        PR_PWDCOLOR="%F{yellow}"
    else
        PR_PWDCOLOR="${PR_BRIGHT_RED}"
    fi

    if [[ $exit_status -ne 0 ]]; then
        EXIT_STATUS=" %B%F{blue}◆%f%b %B%F{$HASH_MOD}Exit Code:%b%f %B%F{yellow}${exit_status}%b%f"
    else
        EXIT_STATUS=""
    fi

LINE1_PROMPT="\
%B%F{red}▶%f%b%F{red}▶%B%F{red}▶%f%b \
%B%F{white}%D{%R.%S %a %b %d %Y}%b%f\
${EXIT_STATUS}\
%(1j. %B%F{green}◆%f%b %B%F{yellow}Jobs: %j%f%b.)\
${PR_BATTERY}\
%B%F{red}◀%f%b%F{red}◀%B%F{red}◀%f%b"

    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 2 ))
    LINE1=${(e%)LINE1_PROMPT} SSH_P=${(e%)SSH_PROMPT}
    #$LINE1
    LINE1_LENGTH=${#${LINE1//^[\[[^m]##m/}}
    FILL_SPACES=${(l:TERMWIDTH - (LINE1_LENGTH + SSH_P_LENGTH):: :)}

    print -- "$LINE1"
}

PROMPT='${PROMPT_LINE}%B%F{green}:%f%b${PR_PWDCOLOR}%~${PR_RESET}${vcs_info_msg_0_}%(!.%B%F{red}%#%f%b.%B%F{green}➤%f%b) '

if [[ -n $TMUX ]]; then;
    alias vim="reattach-to-user-namespace vim";
fi


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm default


export LANGUAGE="en_GB.UTF-8"

export NODE_PATH="/usr/local/lib/node_modules"

unsetopt no_match

export PATH=$PATH:/usr/local/opt/go/libexec/bin

export PATH="$PATH:/usr/local/sbin"

autoload -U zmv


#ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[white]%}%{✚%G%}"
