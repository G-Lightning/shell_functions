#!/bin/bash

COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[1;33m"
COLOR_BLUE="\033[4;34m"
COLOR_GREEN="\033[3;32m"
COLOR_PURPLE="\033[5;35m"

COLOR_END="\033[0m"

function echoRed(){
    echo -e "${COLOR_RED}$@${COLOR_END}"
}

function echoYellow(){
    echo -e "${COLOR_YELLOW}$@${COLOR_END}"
}
function echoBlue(){
    echo -e "${COLOR_BLUE}$@${COLOR_END}"
}
function echoGreen(){
    echo -e "${COLOR_GREEN}$@${COLOR_END}"
}
function echoPurple(){
    echo -e "${COLOR_PURPLE}$@${COLOR_END}"
}

echoRed Hello Red
echoYellow Hello Yellow
echoBlue Hello Blue
echoGreen Hello Green
echoPurple Hello Purple
