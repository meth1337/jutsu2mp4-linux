#!/bin/bash

# глобальные переменные
version="0.0.0"

# цвета
green="\e[1;32m"
red="\e[1;31m"
reset="\e[1;0m"

# функции
function hp {
        echo -e "$green-jutsu2mp4-$reset v$version\n"
        echo -e "$greenиспользование:$reset jutsu2mp4 -опция / --опции"
        echo "все опции:"
        echo -e "$green-h$reset / $green--help$reset: показать это сообщение"
        echo -e "$green-d$reset / $green--download$reset: сгенерировать ссылку на скачивание эпизода"
        echo -e "$green-s$reset / $green--status$reset: проверить статус jut.su"

}

function st {
        if curl -s --head --request GET https://jut.su/ | grep "200 OK"; then
                echo -e "статус jutsu: $greenонлайн$reset"
        else
                echo -e "статус jutsu: $redоффлайн$reset"
        fi
}

function dl {
        echo -e "$greenвведите ссылку на эпизод$reset: "
    read url
    curl $url > tmp.html
        clear
        echo -e "$greenссылки на скачивание$reset:"
    cat tmp.html | ./pup "video" | tail -n +2 | head -4
        rm tmp.html
}

# работа с аргументами
case "${1}" in
        -h|--help)
                hp
                ;;
        -s|--status)
                st
                ;;
        -d|--download)
                dl
                ;;
        -?*)
                echo -e "$redошибка$reset: неизвестная опция: $1"
                echo "чтобы получить возможные опции используйте $0 -h"
        #*)
        #    echo "$redошибка$reset: вы не указали опцию!"
        #       echo "чтобы получить список опций используйте $0 -h"
        #       ;;
esac

