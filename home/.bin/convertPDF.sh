#!/bin/bash

# Для каждого файла из параметров коммандной строки
for cfile in "$@"; do
    # Если существует
    if [ -f "${cfile}" ]; then
        # Если pdf
        if [ $(file -b --mime-type "${cfile}") == "application/pdf" ]; then
            # Добавляем префикс new_
            file_out=$(dirname "$cfile")"/new_"$(basename "$cfile")
            # Конвертируем
            convert -density 150x150 -quality 60 -compress jpeg "$cfile" "$file_out"
        fi
    fi
done
