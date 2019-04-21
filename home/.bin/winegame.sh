#!/bin/bash

SCRIPTNAME="$(basename "${0}" .sh)"

# Настройка логирования
LOGFILE="/tmp/${SCRIPTNAME}.log"

# Параметры по умолчанию
## Экран
DEVICE="LVDS1"
RESOLUTION="1366x768"
GPU=""
DISPLAY=9
TTY="vt9"

## Файл инициализации X сервера
XINITFILE="/tmp/${SCRIPTNAME}.xininitrc"

## Настройки wine
PREFIX="${HOME}/.wine"
DESKTOP=false

## Запускаемое приложение
COMMAND=""
ARGUMENTS=""

## Настройки запуска сервера VNC
VNCRUN=false
VNCPORT=5901
VNCLOG="/tmp/${SCRIPTNAME}.x11vnc.log"

## Настройки boss
BINDINITFILE="/tmp/${SCRIPTNAME}.xbindrc"
BOSSKEY=""
ONBOSS=""

## Молчаливый режим
SILENT=false

# Обработка аргументов командной строки
while true; do
    case "${1}" in
        # Имя префикса
        -p | --prefix ) PREFIXNAME="${2}"; PREFIX="${HOME}/.local/share/wineprefixes/${2}"; shift 2 ;;
        # Запускаемая программа (обязательно)
        -c | --command ) COMMAND="${2}"; shift 2 ;;
        # Аргументы программы
        -a | --arguments ) ARGUMENTS="${2}"; shift 2 ;;
        # Разрешение экрана
        -r | --resolution ) RESOLUTION="${2}"; shift 2 ;;
        # Запускать wine Desktop
        -d | --desktop ) DESKTOP=true; shift ;;
        # Запустить сервер VNC
        -v | --vncrun ) VNCRUN=true; shift ;;
        # Запускать с видеокартой nvidia (по умолчанию intel)
        -g | --nvidia-gpu) GPU="optirun -b primus"; shift ;;
        # Задать <BOSSKEY>;<KEY1>[<KEY2>...] - при нажатии BOSSKEY эмулируется поседовательность нажатий после ';'
        -b | --bossmode ) IFS=';' read -r BOSSKEY ONBOSS <<< "${2}"; shift 2;;
        # Молчаливый режим
        -s | --silent ) SILENT=true; shift ;;
        # Включить лог
        -l | --log-to-file) exec > >(tee -i "${LOGFILE}"); exec 2>&1; shift ;;
        -- ) shift; break ;;
        * ) if [[ -z "${1}" ]]; then break; else echo "${1} is not a valid option"; exit 1; fi;;
    esac
done

## Команда должна быть задана
[[ -z $COMMAND ]] &&  echo "'--command' argument must be specified" && exit 1
## Если задана BOSSKEY должна быть задана последовательность ONBOSS
[[ -n "${BOSSKEY}" ]] && [[ -z "${ONBOSS}" ]] && echo "--bossmode must be specified correctly" && exit 1

# Вывод параметров запуска
if [[ "${SILENT}" == false ]]; then
    echo    "DEVICE=${DEVICE}"
    echo    "RESOLUTION=${RESOLUTION}"
    [[ "${GPU}" == "" ]] && echo "GPU=Intel" || echo "GPU=NVIDIA"
    echo    "DISPLAY=:${DISPLAY}"
    echo    "PREFIXNAME=${PREFIXNAME}"
    echo    "PREFIX=${PREFIX}"
    echo    "DESKTOP=${DESKTOP}"
    echo    "COMMAND=${COMMAND}"
    echo    "ARGUMENTS=${ARGUMENTS}"
    echo    "VNCRUN=${VNCRUN}"
    echo    "BOSSKEY=${BOSSKEY}"
    echo    "ONBOSS=${ONBOSS}"
fi

# Удаление временных файлов
[[ -f "${XINITFILE}" ]] && rm "${XINITFILE}"
[[ -f "${BINDINITFILE}" ]] && rm "${BINDINITFILE}"

# Формируем xinit файл
## Параметры экрана
echo xrandr > "${XINITFILE}"
echo xrandr --output "${DEVICE}" --mode "${RESOLUTION}" >> "${XINITFILE}"

## Параметры раскладки
echo setxkbmap -model pc105 -layout us,ru -variant , -option grp:menu_toggle >> "${XINITFILE}"

# TouchPad
echo synclient TouchpadOff=1 >> "${XINITFILE}"

## Настройка BOSSKEY
if [[ -n "${BOSSKEY}" ]]; then
    echo \"DISPLAY=:"${DISPLAY}" xdotool key "${ONBOSS}"\" > "${BINDINITFILE}"
    echo "${BOSSKEY}" + Release >> "${BINDINITFILE}"
    echo xbindkeys -X :"${DISPLAY}" -f "${BINDINITFILE}" >> "${XINITFILE}"
fi

## Запуск VNC
if [[ "${VNCRUN}" == true ]]; then
    echo /usr/bin/x11vnc -display :"${DISPLAY}" -rfbport "${VNCPORT}" -notruecolor -noxdamage -forever -nopw -o "${VNCLOG}" '&' >> "${XINITFILE}"
fi

## Настройка рабочего стола wine
if [[ "${DESKTOP}" == true ]]; then
    DESKTOP="explorer /desktop=${PREFIXNAME},${RESOLUTION}"
else
    DESKTOP=""
fi

## Запуск wine
[[ "${SILENT}" == true ]] && echo "export WINEDEBUG=-all" >> "${XINITFILE}"
echo "export WINEPREFIX=${PREFIX}" >> "${XINITFILE}"
# Запускаем wine
echo "${GPU} wine ${DESKTOP} \"${COMMAND}\" ${ARGUMENTS}" >> "${XINITFILE}"

# Запуск X сервера
[[ "${SILENT}" == true ]] && XLOG="-quiet"
startx "${XINITFILE}" -- :"${DISPLAY}" -nolisten tcp "${TTY}" "${XLOG}" || exit 1

# Удаление временных файлов
[[ -f "${XINITFILE}" ]] && rm "${XINITFILE}"
[[ -f "${BINDINITFILE}" ]] && rm "${BINDINITFILE}"

exit 0
