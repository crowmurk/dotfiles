#!/bin/env bash

# TMUX настройка и старт сервера

# Если запущен как самостоятельный скрипт
# (TMUX_START может передаваться как переменная окружения)
[[ "${0}" != "${BASH_SOURCE}" && "${ZSH_EVAL_CONTEXT}" =~ :file$ ]] || TMUX_START=true

# 256 цветов в Tmux
[[ -n "${TMUX}" ]] && export TERM=rxvt-unicode-256color

# Если не в сеансе Tmux и (его необходимо запустить или в консоли tty)
if [[ -z "${TMUX}" && ("${TMUX_START}" || "${COLORTERM}" == 'kmscon') ]]; then
    # Если сервер не запущен
    if [[ -z "$(tmux list-sessions 2> /dev/null)" ]]; then
        # Создаем unatached (базовую) сессию и окна по-умолчанию
        tmux new-session -d -s "${USER}" -n system \; send-keys ' journalctl -b -p err --no-pager' C-m \; \
             new-window -n config \; send-keys ' vim' C-m \; \
             new-window -n wiki -c "${HOME}/Dropbox/vimwiki" \; send-keys ' vim' C-m \; \
             new-window -n work
    fi
    # Создаем новую сессию в той же группе с опцией "уничтожать при отсоединении клиента"
    exec tmux new-session -t "${USER}" \; set-option destroy-unattached \; select-window -t :$
fi

kill-tmux() {
    # Работает только в Tmux
    if [[ -z "${TMUX}" ]]; then
        echo "You are not in tmux..."
    else
        # Прекратить работу Tmux
        tmux kill-server
    fi
}

exit() {
    # Работает только в Tmux
    if [[ -z "${TMUX}" ]]; then
        builtin exit
    else
        # Отсоединяем клиента
        tmux detach-client
    fi
}

close() {
    # Работает только в Tmux
    if [[ -z "${TMUX}" ]]; then
        echo "You are not in tmux..."
    else
        # Закрываем текущую панель если она не последняя в окне
        [[ "$(tmux list-panes 2>/dev/null | wc -l)" -gt 1 ]] && builtin exit
        # Закрываем текущее окно если оно не последнее в сеансе
        [[ "$(tmux list-windows 2>/dev/null | wc -l)" -gt 1 ]] && builtin exit
        exit
    fi
}

alias :w='close'
alias :q='exit'
alias :k='kill-tmux'
