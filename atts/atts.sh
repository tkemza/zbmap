#!/usr/bin/bash

## Function for reseting attributes
function reset_color() {
    # Reset color (exit codes)
	tput sgr0   # reset attributes
	tput op     # reset color
	return      # return attribute
}

## Function for terminal ANSI Colors Exit Codes (FG & BG)
function colors() {
    ## ANSI colors (FG & BG) (exit codes)
    # FG (exit codes)
    RED="$(printf '\033[31m')"  
    GREY="$(printf '\033[2;37m')"
    DARKGREEN="$(printf '\033[2;32m')"
    YELLOW="$(printf '\033[1;33m')"
    GREEN="$(printf '\033[32m')"  
    ORANGE="$(printf '\033[33m')"  
    BLUE="$(printf '\033[34m')"
    MAGENTA="$(printf '\033[35m')"  
    CYAN="$(printf '\033[36m')"  
    WHITE="$(printf '\033[37m')" 
    BLACK="$(printf '\033[30m')"
    # BG (exit codes)
    REDBG="$(printf '\033[41m')"  
    GREENBG="$(printf '\033[42m')"  
    ORANGEBG="$(printf '\033[43m')"  
    BLUEBG="$(printf '\033[44m')"
    MAGENTABG="$(printf '\033[45m')"  
    CYANBG="$(printf '\033[46m')"  
    WHITEBG="$(printf '\033[47m')" 
    BLACKBG="$(printf '\033[40m')"
    # Reset functions (exit codes)
    RESETBG="$(printf '\e[0m\n')"
    RESET="$(printf '\033[0m')"
}

## Function for ANSI Text Attributes (Custom Terminal Fonts)
function textAttributes() {
    ## ANSI Attributes (exit codes)
    BOLD="$(printf '\033[1m')"
    ITALIC="$(printf '\033[3m')"
    DIM="$(printf '\033[2m')"
    # Reset function
    RESET="$(printf '\033[0m')"
}