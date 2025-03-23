#
# ~/.zshrc
#

# Цвета терминала
eval "$(dircolors -b)"

# Строкa приглашения
autoload -Uz promptinit
promptinit
prompt redhat

# Поддержка цветов
autoload -Uz colors
colors

# Загрузка плагинов
SHELL_CACHE="${HOME}/.cache/zsh"

# Установлен через pacman
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Настройка плагина
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=185'
ZSH_HIGHLIGHT_STYLES[path]='fg=185'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=180'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=180'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=175'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=150'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=150'
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf ' 'fg=87')

### oh-my-zsh (установлен через pacman)
ZSH="/usr/share/oh-my-zsh"
ZSH_CACHE_DIR="${SHELL_CACHE}/oh-my-zsh"
DISABLE_AUTO_UPDATE=true

### antigen
ADOTDIR="${SHELL_CACHE}/antigen"
ANTIGEN_LOG="${ADOTDIR}/antigen.log"
ANTIGEN_DEFAULT_REPO_URL="${ZSH}/plugins"
# antigen установлен через pacman
source /usr/share/zsh/share/antigen.zsh
antigen bundle extract
antigen bundle git
antigen bundle git-prompt
antigen bundle history-substring-search
antigen bundle z
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle pip
antigen bundle systemd
antigen bundle arzzen/calc.plugin.zsh
antigen bundle djui/alias-tips
# antigen bundle docker
# antigen bundle docker-compose
# antigen bundle docker-machine
antigen apply

### alias-tips
export ZSH_PLUGINS_ALIAS_TIPS_EXCLUDES="vi"

### git-prompt
ZSH_THEME_GIT_PROMPT_BRANCH="%{%F{175}%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{%F{180}%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{%F{180}%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{%F{175}%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{%F{150}%}%{✔%G%}"

### history-substring-search
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=179'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=103'

### z
_Z_DATA="${SHELL_CACHE}/z"

### Changing/making/removing directory
source "${ZSH}/lib/directories.zsh"

### Если комманда не найдена
source /usr/share/doc/pkgfile/command-not-found.zsh

# Основные настройки поведения shell
setopt auto_cd extended_glob nomatch notify interactive_comments
unsetopt beep
bindkey -v

# Настройка автодоплнения
autoload -Uz compinit
compinit -d "${SHELL_CACHE}/.zcompdump"

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:approximate:*' max-errors 1
zstyle ':completion:*:descriptions' format $'\e[38;5;179m---- %d ----\e[0m'
zstyle ':completion:*:messages' format $'\e[38;5;150m---- %d ----\e[0m'
zstyle ':completion:*:corrections' format $'\e[38;5;87m---- %d (errors: %e) ----\e[0m'
zstyle ':completion:*:options' list-colors '=^(-- *)=38;5;117'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections   true
zstyle ':completion:*:man:*' menu yes select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' verbose yes
zstyle ':completion:*' rehash yes

### Дополнение для команды kill
zstyle ':completion:*:processes' command 'ps -xuf'
zstyle ':completion:*:processes-names' command 'ps xho command'
zstyle ':completion:*:processes' sort false
setopt complete_aliases

# Настройка истории
export HISTFILE="${HOME}/.bash_history"
export HISTSIZE=100000
export SAVEHIST=100000
setopt hist_ignore_all_dups hist_reduce_blanks hist_ignore_space inc_append_history hist_save_no_dups

### Поиск оп истории
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^X^X' history-beginning-search-menu

# Настройка для команды help
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
alias help=run-help

# Переназначение клавиш
typeset -A key

bindkey "$terminfo[kich1]"    vi-insert                # Ins
bindkey "$terminfo[kdch1]"    delete-char              # Del
bindkey "$terminfo[khome]"    beginning-of-line        # Home
bindkey "$terminfo[kend]"     end-of-line              # End
bindkey "$terminfo[kcub1]"    backward-char            # Left
bindkey "$terminfo[kcuf1]"    forward-char             # Right
bindkey "$terminfo[kpp]"      beginning-of-history     # PgUp
bindkey "$terminfo[knp]"      end-of-history           # PgDn
bindkey "$terminfo[kcuu1]"    up-line-or-history       # Up
bindkey "$terminfo[kcud1]"    down-line-or-history     # Down

# Поиск по истории
bindkey -M viins "^[k" history-substring-search-up
bindkey -M viins "^[j" history-substring-search-down
bindkey -M vicmd "^[k" history-substring-search-up
bindkey -M vicmd "^[j" history-substring-search-down

bindkey -M vicmd ':'  vi-insert

# Навигация меню Alt+
bindkey "^[n" expand-or-complete
bindkey "^[p" reverse-menu-complete

# Навигация autosuggestions Alt+
bindkey "^[l" forward-word
bindkey "^[h" backward-delete-word
bindkey '^[;' autosuggest-accept

# Индикатор командного режима
KEYTIMEOUT=1

set-vi-status-prompt() {

    [[ "${VIRTUAL_ENV}" ]] && VISTATUS_FLAG="☸($(basename $VIRTUAL_ENV))" || VISTATUS_FLAG="⚑"

    case "${KEYMAP}" in
        (main|viins)
            VISTATUS="%{%F{103}%}${VISTATUS_FLAG}%{%f%}" ;;
        (vicmd)
            VISTATUS="%{%F{179}%}${VISTATUS_FLAG}%{%f%}" ;;
        (vivis|vivli)
            VISTATUS="%{%F{112}%}${VISTATUS_FLAG}%{%f%}" ;;
    esac

    RPROMPT=""
    PROMPT="${VISTATUS}$(git_super_status)"'[%n@%m %{%F{179}%}%1~%{%f%}]%(!.%{%F{179}%}#%{%f%}.$) '
}

set-vi-status-prompt

function zle-keymap-select zle-line-init zle-line-finish {
    set-vi-status-prompt
    zle -R
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
zle -N edit-command-line

# history
alias hl=' history 0'
alias hc=' history.py -use'
alias hg=' history 0 | grep'
alias hd=' historydelete'
alias hr=' fc -R'

# Установка глобальных псевдонимов для конвееров
alias -g M='|more'
alias -g L='|less'
alias -g H='|head'
alias -g T='|tail'
alias -g G='|grep'
alias -g C='|wc --bytes'
alias -g CL='|wc --lines'
alias -g S='|sort'
alias -g V='|vim -'
alias -g N='2>/dev/null'
alias -g TD='|python -c "import sys;from datetime import datetime as dt;print(dt.now() - dt.fromisoformat(sys.stdin.readline().strip()))"'

#
# Удаление последних строк из истории
#       historydelete([lines=0])
historydelete() {
    # Число удаляемых строк истории
    lines=0
    # Если параметр число
    if [[ "${1}" =~ ^[0-9]+$ ]] ; then
        # Большее 1
        if [[ "${1}" -gt 1 ]] ; then
            lines=$((${1}-1))
        fi
    fi
    # Удаляем строк из файла истории
    sed -i "$(($(wc -l < ${HISTFILE})-${lines})),$ d" "${HISTFILE}"
    # Загружаем историю из файла
    fc -R
}

#
# Генератор паролей
#       genpassword([passlen=21], [harden=A-z0-9])
genpassword() {
    # Если первый параметр число
    if [[ "${1}" =~ ^[0-9]+$ ]] ; then
        local passlen="${1}"
        local harden="${2}"
    else
        local passlen=21
        # Если присутствует второй параметр
        if [[ -n "${2}" ]]; then
            local harden="${2}"
        else
            local harden="${1}"
        fi
    fi

    local passchars="A-Za-z0-9${harden}"

    tr -dc "${passchars}" < /dev/urandom | head -c "${passlen}" | xargs
}

#
# Вычисляет промежуток времени от даты до настоящего момента
#       timedelta()
daydelta() {
    local seconds=$(($(date '+%s') - $(date -d ${1} '+%s')))
    local days=$((${seconds}/(60*60*24)))
    echo $days
}

# Common for all shells
source "${HOME}/.shellrc"

# mc zsh subshell bug
alias mc="SHELL=$(which bash) . /usr/lib/mc/mc-wrapper.sh"
