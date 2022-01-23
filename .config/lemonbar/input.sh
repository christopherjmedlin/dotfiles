#!/bin/sh

clock() {
    date
}

battery() {
    apm -l
}

while true
do
    BAR_INPUT="%{c}LIFE : $(battery)% | TIME : $(clock)"
    echo $BAR_INPUT
    sleep 1
done
