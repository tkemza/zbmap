#!/usr/bin/bash

#   Author        :       Tkemza

#   Tool          :       ZBmap

#   Github        :       https://github.com/tkemza

#   Discord       :       n1kolicc

#   Licnese       :       GPL-3.0 2024 Copyright ©  2020  Free  Software  Foundation,  Inc.   
#                         GPLv3+:  GNU  GPL  version  3  or  later  
#                         https://gnu.org/li‐censes/gpl.html.
#                         ZeroByte A.K.A ZByte [tkemza]


# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# The licenses for most software and other practical works are designed
# to take away your freedom to share and change the works.  By contrast,
# the GNU General Public License is intended to guarantee your freedom to
# share and change all versions of a program--to make sure it remains free
# software for all its users.  We, the Free Software Foundation, use the
# GNU General Public License for most of our software; it applies also to
# any other work released this way by its authors.  You can apply it to
# your programs, too.
# 
# When we speak of free software, we are referring to freedom, not
# price.  Our General Public Licenses are designed to make sure that you
# have the freedom to distribute copies of free software (and charge for
# them if you wish), that you receive source code or can get it if you
# want it, that you can change the software or use pieces of it in new
# free programs, and that you know you can do these things.
# 
# To protect your rights, we need to prevent others from denying you
# these rights or asking you to surrender the rights.  Therefore, you have
# certain responsibilities if you distribute copies of the software, or if
# you modify it: responsibilities to respect the freedom of others.
# 
# For example, if you distribute copies of such a program, whether
# gratis or for a fee, you must pass on to the recipients the same
# freedoms that you received.  You must make sure that they, too, receive
# or can get the source code.  And you must show them these terms so they
# know their rights.
# 
# Developers that use the GNU GPL protect your rights with two steps:
# (1) assert copyright on the software, and (2) offer you this License
# giving you legal permission to copy, distribute and/or modify it.
# 
# For the developers' and authors' protection, the GPL clearly explains
# that there is no warranty for this free software.  For both users' and
# authors' sake, the GPL requires that modified versions be marked as
# changed, so that their problems will not be attributed erroneously to
# authors of previous versions.
# You may not propagate or modify a covered work
#
# Some devices are designed to deny users access to install or run
# modified versions of the software inside them, although the manufacturer
# can do so.  This is fundamentally incompatible with the aim of
# protecting users' freedom to change the software.  The systematic
# pattern of such abuse occurs in the area of products for individuals to
# use, which is precisely where it is most unacceptable.  Therefore, we
# have designed this version of the GPL to prohibit the practice for those
# products.  If such problems arise substantially in other domains, we
# stand ready to extend this provision to those domains in future versions
# of the GPL, as needed to protect the freedom of users.
# "Additional permissions" are terms that supplement the terms of this
# License by making exceptions from one or more of its conditions.
# Additional permissions that are applicable to the entire Program shall
# be treated as though they were included in this License, to the extent
# that they are valid under applicable law.  If additional permissions
# apply only to part of the Program, that part may be used separately
# under those permissions, but the entire Program remains governed by
# this License without regard to the additional permissions.
# 
# When you convey a copy of a covered work, you may at your option
# remove any additional permissions from that copy, or from any part of
# it.  (Additional permissions may be written to require their own
# removal in certain cases when you modify the work.)  You may place
# additional permissions on material, added by you to a covered work,
# for which you have or can give appropriate copyright permission.
# 
# Notwithstanding any other provision of this License, for material you
# add to a covered work, you may (if authorized by the copyright holders of
# that material) supplement the terms of this License with terms:
# Finally, every program is threatened constantly by software patents.
# States should not allow patents to restrict development and use of
# software on general-purpose computers, but in those that do, we wish to
# avoid the special danger that patents applied to a free program could
# make it effectively proprietary.  To prevent this, the GPL assures that
# patents cannot be used to render the program non-free.
# All other non-permissive additional terms are considered "further
# restrictions" within the meaning of section 10.  If the Program as you
# received it, or any part of it, contains a notice stating that it is
# governed by this License along with a term that is a further
# restriction, you may remove that term.  If a license document contains
# a further restriction but permits relicensing or conveying under this
# License, you may add to a covered work material governed by the terms
# of that license document, provided that the further restriction does
# not survive such relicensing or conveying.
# 
# If you add terms to a covered work in accord with this section, you
# must place, in the relevant source files, a statement of the
# additional terms that apply to those files, or a notice indicating
# where to find the applicable terms.
# 
# Additional terms, permissive or non-permissive, may be stated in the
# form of a separately written license, or stated as exceptions;
# the above requirements apply either way.
# The precise terms and conditions for copying, distribution and
# modification follow.

# The Zbmap scanner is a high-performance network mapping tool  
# Designed for fast and efficient scanning of large IP address spaces, identifying open ports and vulnerabilities.


### Use at your own risk. The creator will not be responsible for any adverse consequences caused by the use of this tool ###


## Including sources
source atts/atts.sh # Including attributes (color, font, text reset, ...)
textAttributes # Calling functions
reset_color # Calling functions
colors # Calling functions

## Including tool expressions
VERSION=1.0.0 # Tool Version 
HOST=127.0.0.1 # Default Host
PORT=8080 # Default Port

## Script termination
exit_on_signal_SIGINT() {
	{ printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Interrupted." 2>&1; reset_color; }
	exit 0 # Set exit code to 0
}

exit_on_signal_SIGTERM() {
	{ printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Terminated." 2>&1; reset_color; }
	exit 0 # Set exit code to 0
}

## Trap command for 2 Functions (for exiting or interrupted program messages)
trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Function for checking update 
function chk_updt() {
    updt=1 # Setting variable for system update
    if [ $udpt -eq 1 ]; then
        # Command for system update
        sudo apt-get update -y 
    else 
        # Error message 
        printf "${RED}[${RESETBG}!${RED}] Error while downloading system update."
    fi 
}

## Function for checking package
function chk_pkg() {
    # Check if there is command "nmap"
    if ! command -v nmap >/dev/null 2>&1; then
        sudo apt-get install nmap -y
    elif command -v nmap >/dev/null 2>&1; then 
        # Message for package that has been already downloaded
        printf "${DARKGREEN}[${RESETBG}!${DARKGREEN}] Package has already been downloaded."
    else 
        # Error message if package is not downloaded properly
        printf "${RED}[${RESETBG}!${RED}] Error while downloading package."
    fi
}

if [ "$UID" -eq 0 ]; then 
    echo 
    root_msg_true="${GREEN}User is root.${RESETBG}"

    for (( i=0; i<${#root_msg_true}; i++)); do
        echo -n "${root_msg_true:$i:1}"
        sleep 0.06
    done 
    sleep 0.9
else 
    echo 
    root_msg_false="${RED}User must be root to get access to the tool.${RESETBG}"
    echo 

    for (( i=0; i<${#root_msg_false}; i++)); do
        echo -n "${root_msg_false:$i:1}"
        sleep 0.06
    done
    exit 1
fi 


## Function warning message
function warning_msg() {
    echo # Making space
    # "Warning" Message
    warning_message="         ${REDBG}Warning!${RESETBG}
                  ZBmap is an illegal network tool known to perform unauthorized actions,
                  including stealing IP information and compromising system security. 
                  Using this tool may violate data privacy laws and result in severe legal consequences. 
                  Unauthorized network scanning and exploitation with 
                  ZBmap could expose you to criminal prosecution and hefty fines."
    for (( i=0; i<${#warning_message}; i++ )); do
        # Print one character at a time without a new line
        echo -n "${warning_message:$i:1}"
        # Add a 0.2 second delay
        sleep 0.02 # Time sleep set to 0.02
    done
    echo # Making space
}

## Function about message
function about_msg() {
    echo # Making space
    # "About" Message 
    about_message="         ${BLUEBG}About:${RESETBG}              
                  Zbmap is a fast and efficient IP scanner designed for network mapping and security auditing. 
                  It quickly scans large IP ranges, providing detailed insights into active hosts, services, 
                  and potential vulnerabilities."
    for (( i=0; i<${#about_message}; i++)); do
        # Print one character at a time without a new line
        echo -n "${warning_message:$i:1}"
        # Add a 0.2 second delay
        sleep 0.02 # Time sleep set to 0.02
    done
    echo # Making space
}

function about_win() {
    clear
    cat <<- EOF
    ${RED}
     ▄▄▄       ▄▄▄▄    ▒█████   █    ██ ▄▄▄█████▓   
    ▒████▄    ▓█████▄ ▒██▒  ██▒ ██  ▓██▒▓  ██▒ ▓▒   
    ▒██  ▀█▄  ▒██▒ ▄██▒██░  ██▒▓██  ▒██░▒ ▓██░ ▒░   
    ░██▄▄▄▄██ ▒██░█▀  ▒██   ██░▓▓█  ░██░░ ▓██▓ ░    
     ▓█   ▓██▒░▓█  ▀█▓░ ████▓▒░▒▒█████▓   ▒██▒ ░    
     ▒▒   ▓▒█░░▒▓███▀▒░ ▒░▒░▒░ ░▒▓▒ ▒ ▒   ▒ ░░      
      ▒   ▒▒ ░▒░▒   ░   ░ ▒ ▒░ ░░▒░ ░ ░     ░       
      ░   ▒    ░    ░ ░ ░ ░ ▒   ░░░ ░ ░   ░         
          ░  ░ ░          ░ ░     ░                 
                    ░                               
    ${RESETBG}
EOF
}

function about_tool_win() {
    clear
    cat <<- EOF
    ${RED}
     ▄▄▄       ▄▄▄▄    ▒█████   █    ██ ▄▄▄█████▓   ▄▄▄█████▓ ▒█████   ▒█████   ██▓    
    ▒████▄    ▓█████▄ ▒██▒  ██▒ ██  ▓██▒▓  ██▒ ▓▒   ▓  ██▒ ▓▒▒██▒  ██▒▒██▒  ██▒▓██▒    
    ▒██  ▀█▄  ▒██▒ ▄██▒██░  ██▒▓██  ▒██░▒ ▓██░ ▒░   ▒ ▓██░ ▒░▒██░  ██▒▒██░  ██▒▒██░    
    ░██▄▄▄▄██ ▒██░█▀  ▒██   ██░▓▓█  ░██░░ ▓██▓ ░    ░ ▓██▓ ░ ▒██   ██░▒██   ██░▒██░    
     ▓█   ▓██▒░▓█  ▀█▓░ ████▓▒░▒▒█████▓   ▒██▒ ░      ▒██▒ ░ ░ ████▓▒░░ ████▓▒░░██████▒
     ▒▒   ▓▒█░░▒▓███▀▒░ ▒░▒░▒░ ░▒▓▒ ▒ ▒   ▒ ░░        ▒ ░░   ░ ▒░▒░▒░ ░ ▒░▒░▒░ ░ ▒░▓  ░
      ▒   ▒▒ ░▒░▒   ░   ░ ▒ ▒░ ░░▒░ ░ ░     ░           ░      ░ ▒ ▒░   ░ ▒ ▒░ ░ ░ ▒  ░
      ░   ▒    ░    ░ ░ ░ ░ ▒   ░░░ ░ ░   ░           ░      ░ ░ ░ ▒  ░ ░ ░ ▒    ░ ░   
          ░  ░ ░          ░ ░     ░                              ░ ░      ░ ░      ░  ░
                    ░                                                                  
    ${RESETBG}
EOF
}

function usage_tool_win() {
    clear 
    cat <<- EOF
    ${RED}

     █    ██   ██████  ▄▄▄        ▄████ ▓█████ 
     ██  ▓██▒▒██    ▒ ▒████▄     ██▒ ▀█▒▓█   ▀ 
    ▓██  ▒██░░ ▓██▄   ▒██  ▀█▄  ▒██░▄▄▄░▒███   
    ▓▓█  ░██░  ▒   ██▒░██▄▄▄▄██ ░▓█  ██▓▒▓█  ▄ 
    ▒▒█████▓ ▒██████▒▒ ▓█   ▓██▒░▒▓███▀▒░▒████▒
    ░▒▓▒ ▒ ▒ ▒ ▒▓▒ ▒ ░ ▒▒   ▓▒█░ ░▒   ▒ ░░ ▒░ ░
    ░░▒░ ░ ░ ░ ░▒  ░ ░  ▒   ▒▒ ░  ░   ░  ░ ░  ░
     ░░░ ░ ░ ░  ░  ░    ░   ▒   ░ ░   ░    ░   
       ░           ░        ░  ░      ░    ░  ░
    ${RESETBG}
EOF
}

## Function Menu
function menu_win() {
    clear 
    local __version__=1.0.0
    cat <<- EOF 
    ${RED}

    ▒███████▒ ▄▄▄▄    ███▄ ▄███▓ ▄▄▄       ██▓███  
    ▒ ▒ ▒ ▄▀░▓█████▄ ▓██▒▀█▀ ██▒▒████▄    ▓██░  ██▒
    ░ ▒ ▄▀▒░ ▒██▒ ▄██▓██    ▓██░▒██  ▀█▄  ▓██░ ██▓▒
      ▄▀▒   ░▒██░█▀  ▒██    ▒██ ░██▄▄▄▄██ ▒██▄█▓▒ ▒
    ▒███████▒░▓█  ▀█▓▒██▒   ░██▒ ▓█   ▓██▒▒██▒ ░  ░
    ░▒▒ ▓░▒░▒░▒▓███▀▒░ ▒░   ░  ░ ▒▒   ▓▒█░▒▓▒░ ░  ░
    ░░▒ ▒ ░ ▒▒░▒   ░ ░  ░      ░  ▒   ▒▒ ░░▒ ░     
    ░ ░ ░ ░ ░ ░    ░ ░      ░     ░   ▒   ░░       
      ░ ░     ░             ░         ░  ░    ░     Version: ${__version__}
    ░              ░           ░                    
    ${RESETBG}                                                                       
EOF

    cat <<- EOF
${RED}[${WHITE}::${RED}]${ORANGE} Tool made by ZeroByte A.K.A Zbyte ${RED}[${WHITE}::${RED}]${ORANGE}
		${RED}[${WHITE}::${RED}]${ORANGE} Select An Attack For Your Victims IP ${RED}[${WHITE}::${RED}]${ORANGE}

		${RED}[${WHITE}01${RED}]${ORANGE} Simple Scan                   ${RED}[${WHITE}14${RED}]${ORANGE} Service and version      
		${RED}[${WHITE}02${RED}]${ORANGE} Verbose mode                  ${RED}[${WHITE}15${RED}]${ORANGE} Complete scan   
		${RED}[${WHITE}03${RED}]${ORANGE} Increased verbose mode        ${RED}[${WHITE}16${RED}]${ORANGE} Operating systems   
		${RED}[${WHITE}04${RED}]${ORANGE} TCP scan                      ${RED}[${WHITE}17${RED}]${ORANGE} Operating systems and services   
		${RED}[${WHITE}05${RED}]${ORANGE} UDP scan                      ${RED}[${WHITE}18${RED}]${ORANGE} Fast scan of 100 ports   
		${RED}[${WHITE}06${RED}]${ORANGE} Scan without sending packets  ${RED}[${WHITE}19${RED}]${ORANGE} Slow scan (avoid IDS)   
		${RED}[${WHITE}07${RED}]${ORANGE} Host discovery                ${RED}[${WHITE}20${RED}]${ORANGE} Vulnerability scan   			
		${RED}[${WHITE}08${RED}]${ORANGE} Host with open ports          ${RED}[${WHITE}21${RED}]${ORANGE} Use specific scripts   
		${RED}[${WHITE}09${RED}]${ORANGE} Ping scan                     ${RED}[${WHITE}22${RED}]${ORANGE} Statistics every 30 seconds       
		${RED}[${WHITE}10${RED}]${ORANGE} Range of IP addresses         ${RED}[${WHITE}23${RED}]${ORANGE} Minimum packet rate       
		${RED}[${WHITE}11${RED}]${ORANGE} All ports                     ${RED}[${WHITE}24${RED}]${ORANGE} 20 most common ports       
		${RED}[${WHITE}12${RED}]${ORANGE} 1000 most common ports        ${RED}[${WHITE}25${RED}]${ORANGE} Export in XML
${RED}[${WHITE}13${RED}]${ORANGE} Script scan                   ${RED}[${WHITE}26${RED}]${ORANGE} Export in Web XML   

${RED}[${WHITE}00${RED}]${ORANGE} Exit       ${RED}[${WHITE}77${RED}]${ORANGE} About Tool     ${RED}[${WHITE}99${RED}]${ORANGE} About    ${RED}[${WHITE}usage${RED}]${ORANGE} Tool Usage

${RED}[${WHITE}pkg${RED}]${ORANGE} Check For Package   ${RED}[${WHITE}update${RED}]${ORANGE} Check for update   ${RED}[${WHITE}rf${RED}]${ORANGE} Refresh Tool                                                                   

EOF
    read -p "${RED}[${WHITE}-${RED}]${ORANGE} Select an option : ${RED}" input
    
    case $input in 
        1 | 01)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Simple Scan Menu"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter 1 host without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's ip address ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap "$target"
                    echo
                fi
            done
            ;;
        2 | 02)
            clear 
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Verbose mode"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter 1 host without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's ip address ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap -v "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap -v "$target"
                    echo
                fi
            done
            ;;
        3 | 03)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Increased verbose mode"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter 1 host without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's ip address ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap -vv "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap -vv "$target"
                    echo
                fi
            done
            ;;
        4 | 04)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} TCP scan"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter 1 host without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's ip address ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap -sS "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap -sS "$target"
                    echo
                fi
            done
            ;;
        5 | 05)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} UDP scan"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter 1 host without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's ip address ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap -sU "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap -sU "$target"
                    echo
                fi
            done
            ;;
        6 | 06)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Scan without sending packets"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter network without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's network ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap -sn "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan network: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap -sn "$target"
                    echo
                fi
            done
            ;;
        7 | 07)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Host discovery"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter network without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's network ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap -sp "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan network: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap -sp "$target"
                    echo
                fi
            done
            ;;
        8 | 08)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Host with open ports"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter network without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's host ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap --open "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap --open "$target"
                    echo
                fi
            done
            ;;
        9 | 09)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Ping scan"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter host without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's host ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap -Pn "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap -Pn "$target"
                    echo
                fi
            done
            ;;
        10)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Range of IP addresses"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter host without ws (whitespace) > <start_ip>-<end_ip>"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter start and end host ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}start_host${GREY}>${RESETBG} " start_target
                read -p "${GREY}<${RED}start_host${GREY}>${RESETBG} " end_target
                if [[ $start_target == "127.0.0.1" || $end_target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($start_target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap "$start_target"-"$end_target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $start_target == "e" ]]; then
                    clear
                    menu_win 
                elif [[ $end_target == "e" ]]; then
                    clear
                    menu_win
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$start_target${RESETBG}-${RED}$end_target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap "$start_target" "$end_target"
                    echo
                fi
            done
            ;;
        11)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} All ports"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter host without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's host ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap -p "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap -p "$target"
                    echo
                fi
            done
            ;;
        12)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} 1000 most common ports"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter host without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's host ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap -p 1-1000 "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap -p 1-1000 "$target"
                    echo
                fi
            done
            ;;
        13)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Script scan"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter host without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's host ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap -sC "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap -sC "$target"
                    echo
                fi
            done
            ;;
        14)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Service and version"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter host without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's host ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap -sV "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap -sV "$target"
                    echo
                fi
            done
            ;;
        15)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Complete scan"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter host without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's host ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap -sCV "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap -sCV "$target"
                    echo
                fi
            done
            ;;
        16)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Operating systems"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter host without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's host ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap -O "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap -O "$target"
                    echo
                fi
            done
            ;;
        17)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Operating systems and services"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter host without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's host ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap -O -sV -A "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap -O -sV -A "$target"
                    echo
                fi
            done
            ;;
        18)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Fast scan of 100 ports"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter host without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's host ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap -T5-F "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap -T5-F "$target"
                    echo
                fi
            done
            ;;
        19)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Slow scan (avoid IDS)"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter host without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's host ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap -T1 "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap -T1 "$target"
                    echo
                fi
            done
            ;;
        20)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Vulnerability scan"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter host without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's host ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap --script=vuln "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap --script=vuln "$target"
                    echo
                fi
            done
            ;;
        21)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Use specific scripts"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter host without ws (whitespace) > <script_name> <ip>"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's host ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${ORANGE}script_name${GREY}>${RESETBG} " script
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap --script "$script" "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap --script "$script" "$target"
                    echo
                fi
            done
            ;;
        22)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Statistics every 30 seconds"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter host without ws (whitespace) > <time>+s <target>"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's host ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${YELLOW}time${GREY}>${RESETBG} "time
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap --stats-every "$time" "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap --stats-every "$time" "$target"
                    echo
                fi
            done
            ;;
        23)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Minimum packet rate"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter host without ws (whitespace) > <packet_number> <ip>"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's host ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${BLUE}packets_num${GREY}>${RESETBG} " packet
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap --min-rate "$packet" "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap --min-rate "$packet" "$target"
                    echo
                fi
            done
            ;;
        24)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} 20 most common ports"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter host without ws (whitespace)"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's host ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo  
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap --top-ports 20 "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; }
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; } 
                    nmap --top-ports 20 "$target"
                    echo
                fi
            done
            ;;
        25)
           clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Export in XML"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter host without ws (whitespace) > <ip>"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's host ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo 
                DIR_NAME="xml-saves"
                if [ ! -d "$DIR_NAME" ]; then
                    echo "Directory '$DIR_NAME' does not exist. Creating it..."
                    mkdir "$DIR_NAME"
                    echo "Directory '$DIR_NAME' created."
                else
                    echo "Directory '$DIR_NAME' already exists."
                fi
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                read -p "${GREY}<${YELLOW}filename${GREY}>${RESETBG} " filename
                OUTPUT_FILE="save-${filename}.xml"
                FULL_PATH="$DIR_NAME/$OUTPUT_FILE"
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap -oX "$FULL_PATH" "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; } 
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    echo 
                    info_msg="Informations will be saved in '${BLUE}xml-saves${RESETBG}/save-${YELLOW}${filename}${RESETBG}.xml'!"
                    for (( i=0; i<${#info_msg}; i++)); do
                        echo -n "${info_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; }
                    if [[ -e "$filename" ]]; then
                        echo 
                        printf "File '$filename' already exists. Try other name."
                        echo 
                    else 
                        { echo; echo; }
                        nmap -oX "$FULL_PATH" "$target"
                    fi 
                fi
            done
            ;; 
        26)
            clear
            title="${GREY}<${BLUE}title${GREY}>${RESETBG} Export in Web XML"
            for (( i=0; i<${#title}; i++)); do 
                echo -n "${title:$i:1}"
                sleep 0.02
            done 
            { echo; echo; }
            usage="${GREY}<${DARKGREEN}usage${GREY}>${RESETBG} Enter host without ws (whitespace) > <ip>"
            for (( i=0; i<${#usage}; i++)); do 
                echo -n "${usage:$i:1}"
                sleep 0.02
            done
            while true; do
                { echo; echo; }
                info="${GREY}<${BLUE}zbyte${GREY}>${RESETBG} Enter victim's host ('e' for exit to main menu): "
                for (( i=0; i<${#info}; i++)); do
                echo -n "${info:$i:1}"
                sleep 0.02 
                done
                echo 
                DIR_NAME="webxml-saves"
                OUTPUT_FILE="websaves.xml"
                if [ ! -d "$DIR_NAME" ]; then
                    echo "Directory '$DIR_NAME' does not exist. Creating it..."
                    mkdir "$DIR_NAME"
                    echo "Directory '$DIR_NAME' created."
                else
                    echo "Directory '$DIR_NAME' already exists."
                fi
                FULL_PATH="$DIR_NAME/$OUTPUT_FILE"
                read -p "${GREY}<${RED}host${GREY}>${RESETBG} " target
                if [[ $target == "127.0.0.1" ]]; then
                    echo 
                    read -p "Your target ($target) is set by default. Do you want to scan it anyway? (Y/n)" qst
                    if [[ $qst == "y" || $qst == "Y" ]]; then
                        echo 
                        nmap --webxml "$FULL_PATH" "$target"
                    else 
                        echo 
                        printf "${RED}Aborted.${RESETBG}"
                    fi
                elif [[ $target == "e" ]]; then
                    clear
                    menu_win 
                else
                    { echo; echo; } 
                    ping_msg="Preparing to scan host: ${RED}$target${RESETBG}"
                    for (( i=0; i<${#ping_msg}; i++)); do 
                        echo -n "${ping_msg:$i:1}"
                        sleep 0.02
                    done 
                    { echo; echo; }
                    nmap --webxml "$FULL_PATH" "$target"
                fi
            done
            ;; 
        "pkg")
            clear 
            chk_pkg
            sleep 1
            clear
            menu_win
            ;;
        "update")
            clear
            chk_updt
            clear
            sleep 1
            menu_win
            ;;
        "rf")
            clear
            menu_win
            ;;
        "usage")
            clear
            usage_tool_win
            echo 
            usage_msg="${BLUE}            Simple Scan:${RESETBG}
            A simple scan in Nmap performs a basic port scan on the specified target, 
            checking which ports are open without any additional options or verbosity.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}

            ${BLUE}Verbose mode:${RESETBG} 
            Verbose mode in Nmap provides additional details about the scanning 
            process and results, allowing users to see more information during the scan.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}Increased verbose mode:${RESETBG} 
            This includes information on each stage of the scan, such as target discovery, open ports, 
            and scan progress, allowing you to monitor real-time activity more closely.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}TCP scan${RESETBG} 
            Sends TCP packets to a target to determine the status of ports. In a SYN scan (-sS), 
            sends SYN packets and waits for responses without completing the handshake, making it stealthier, 
            while a full TCP connect scan (-sT) establishes a full connection with the target.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}UDP scan${RESETBG} 
            Used to discover open UDP ports on a target system. Since UDP is a connectionless protocol, 
            sends empty UDP packets to each target port and waits for a response, 
            such as an ICMP Port Unreachable message or an application response, to determine the port's state.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}Scan without sending packets${RESETBG} 
            Can be performed using the list scan (-sL) option. This does not send any actual packets to the target; 
            instead, it simply generates and lists the potential targets by performing a reverse DNS resolution on 
            the specified IP range or hostname.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}Host discovery${RESETBG} 
            used to identify live hosts on a network without performing a full port scan. 
            It typically sends ICMP echo requests (ping) or other probe packets (TCP, ARP, etc.) to determine which hosts are up.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}Host with open ports${RESETBG} 
            You can run a basic scan that both discovers hosts and identifies open ports. By default, checks for open ports on reachable hosts.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}Ping scan${RESETBG} 
            Type of host discovery that sends ICMP echo requests (pings) to determine if hosts are up. 
            It may also send ARP requests on local networks or TCP/ACK and SYN packets to see if there are 
            responsive hosts, without performing a port scan.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}Range of IP addresses${RESETBG} 
            You can specify various formats depending on the range you want to target.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}All ports${RESETBG} 
            Option, which instructs zbmap to scan all 65,535 TCP or UDP ports.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}1000 most common ports${RESETBG} 
            Simply run a basic scan without specifying the port range. By default, zbmap scans the top 1000 most commonly used TCP ports.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}Script scan${RESETBG} 
            Uses zbmap scripting engine (NSE) to run various scripts against the target. 
            These scripts can perform tasks such as vulnerability detection, service enumeration, 
            and more, depending on the selected script or category.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}Service and version${RESETBG} 
            This enables zbmap to probe open ports and identify the service running on them, along with its version.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}Complete scan${RESETBG} 
            Involves combining various options to perform an exhaustive scan that includes host discovery, 
            service version detection, OS detection, all ports, and script scanning. 
            This provides detailed information about the target.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}Operating systems${RESETBG} 
            This enables OS fingerprinting, where zbmap analyzes response patterns from the target to guess 
            the underlying operating system.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}Operating systems and services${RESETBG} 
            To detect both operating systems (OS) and services on a target using zbmap, 
            you can combine the -O option for OS detection and the -sV option for service and version detection.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}Fast scan of 100 ports${RESETBG} 
            This option tells zbmap to scan only the most commonly used ports rather than all 65,535 ports.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}Slow scan (avoid IDS)${RESETBG} 
            To perform a slow scan with zbmap that helps avoid Intrusion Detection Systems (IDS), 
            you can use options that reduce the speed and frequency of packet transmission.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}Vulnerability scan${RESETBG} 
            To perform a vulnerability scan using zbmap, you can utilize its zbmap Scripting Engine (NSE) 
            to run specific scripts designed to identify known vulnerabilities in services.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}Use specific scripts${RESETBG} 
            Zbmap's scripting engine has a wide range of scripts that can be used for various purposes, 
            including vulnerability detection, service enumeration, and more.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            ${GREY}<${ORANGE}scriptname${GREY}>${RESETBG} ${ORANGE}<full_script_name_with_ext>${RESETBG}
            
            ${BLUE}Statistics every 30 seconds${RESETBG} 
            This allows you to specify an interval at which zbmap will output progress statistics about the scan.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            ${GREY}<${BLUE}time${GREY}>${RESETBG} ${BLUE}<set_your_custom_time_in_seconds>${RESETBG}
            
            ${BLUE}Minimum packet rate${RESETBG} 
            This option specifies the minimum number of packets that zbmap should send per second. 
            This can be useful for managing the load on the network or for avoiding detection by intrusion detection systems (IDS).
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            ${GREY}<${YELLOW}packet_num${GREY}>${RESETBG} ${YELLOW}<num_of_packets>${RESETBG}
            
            ${BLUE}20 most common ports${RESETBG} 
            To scan the 20 most common ports using zbmap.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            
            ${BLUE}Export in XML${RESETBG} 
            To export the results of an zbmap scan in XML format, you can use the zbmap's options
            followed by the desired output filename. This is useful for processing or analyzing the scan results programmatically.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}
            ${GREY}<${YELLOW}filename${GREY}>${RESETBG} ${BLUE}<file_name_without_ext>${RESETBG}
            
            ${BLUE}Export in Web XML${RESETBG} 
            To export the results of an zbmap scan in XML format for web usage (often referred to as zbmap's XML output, 
            you can use the zbmap's option followed by the filename. This XML output is structured for easy parsing and 
            can be displayed on web interfaces or used by other tools that consume XML.
            ${BLUE}Example:${RESETBG}

            ${GREY}<${RED}host${GREY}>${RESETBG} ${YELLOW}<ip_address>${RESETBG}"

            for (( i=0; i<${#usage_msg}; i++)); do 
                echo -n "${usage_msg:$i:1}"
                sleep 0.0001
            done 
            echo # Making space
            echo # Making spcae 
            echo # Making space
            echo # Making spcae 
            echo # Making space
            echo # Making spcae 
            echo # Making space
            echo # Making spcae 
            read -p "(Press enter to go back to main menu)" button
            if [[ $button == "" ]]; then
                clear
                menu_win
            else    
                echo 
                echo 
                read -p "Did you wanted to press enter to go back to main menu? (Y/n)" yesno
                if [[ $yesno == "y" || $yesno == "Y" ]]; then
                    clear 
                    menu_win
                else
                    clear
                    menu_win
                fi 
            fi 
            ;;
        77)
            echo 
            echo
            about_tool_win
            { echo; echo; }
            local msg="                 
            The ZBmap IP Scanner is a powerful and versatile network scanning tool designed for both security 
            professionals and hobbyists. Developed by ZeroByte (Zbyte), ZBmap enables users to perform comprehensive scans on networks, 
            identify live hosts, discover open ports, and detect running services. With an intuitive command-line interface and a wide 
            range of features, ZBmap is suitable for various applications, from network administration to vulnerability assessments.
            
            In today's interconnected world, understanding the security posture of your network is crucial. 
            Organizations face threats from malicious actors who exploit vulnerabilities in unprotected systems. 
            ZBmap empowers users to proactively identify security weaknesses by providing detailed insights into the devices 
            on their networks. It facilitates scanning for open ports, identifying running services, and even detecting potential 
            vulnerabilities, thereby contributing to improved network security.
            
            ZBmap is designed to be user-friendly, even for those who may not have extensive experience 
            with command-line tools. The clear command structure and descriptive options make it easy to understand and use.
            
            ZBmap allows users to leverage Nmap scripts, extending its functionality and enabling advanced scanning techniques. 
            This feature is particularly useful for vulnerability assessments, as users can run specialized scripts to identify 
            known vulnerabilities in target systems.
            
            While ZBmap is a powerful tool for network discovery and security assessment, users must adhere to ethical guidelines 
            and legal regulations. Scanning networks without explicit permission is illegal and can lead to severe consequences. 
            Users are encouraged to only scan networks they own or have obtained explicit consent to assess.
            
            The ZBmap IP Scanner stands out as an essential tool for anyone interested in network security and management. 
            Its combination of robust features, ease of use, and flexibility makes it suitable for both beginners and experienced 
            professionals. By enabling users to perform thorough scans and gain insights into their networks, 
            ZBmap plays a vital role in enhancing overall security and mitigating potential threats."
            for (( i=0; i<${#msg}; i++)); do 
                echo -n "${msg:$i:1}"
                sleep 0.001
            done
            echo # Making space
            echo # Making spcae 
            echo # Making space
            echo # Making spcae 
            echo # Making space
            echo # Making spcae 
            echo # Making space
            echo # Making spcae 
            read -p "(Press enter to go back to main menu)" button
            if [[ $button == "" ]]; then
                clear
                menu_win
            else    
                echo 
                echo 
                read -p "Did you wanted to press enter to go back to main menu? (Y/n)" yesno
                if [[ $yesno == "y" || $yesno == "Y" ]]; then
                    clear 
                    menu_win
                else
                    clear
                    menu_win
                fi 
            fi 
            ;;
        99)
            about_win
            echo # Making space
            # "About" Message 
            about_message="         ${BLUEBG}About:${RESETBG}              
                          Zbmap is a fast and efficient IP scanner designed for network mapping and security auditing. 
                          It quickly scans large IP ranges, providing detailed insights into active hosts, services, 
                          and potential vulnerabilities."
            for (( i=0; i<${#about_message}; i++)); do
            # Print one character at a time without a new line
            echo -n "${about_message:$i:1}"
            # Add a 0.2 second delay
            sleep 0.006 # Time sleep set to 0.02
            done
            echo # Making space
            echo # Making space
            sleep 1
            # "Warning" Message
            warning_message="         ${REDBG}Warning!${RESETBG}
                          ZBmap is an illegal network tool known to perform unauthorized actions,
                          including stealing IP information and compromising system security. 
                          Using this tool may violate data privacy laws and result in severe legal consequences. 
                          Unauthorized network scanning and exploitation with 
                          ZBmap could expose you to criminal prosecution and hefty fines."
            for (( i=0; i<${#warning_message}; i++ )); do
                # Print one character at a time without a new line
                echo -n "${warning_message:$i:1}"
                # Add a 0.2 second delay
                sleep 0.006 # Time sleep set to 0.02
            done
            echo
            echo 

            tnk_msg="         About author: 
                          Author: Tkemza    
                          Github: https://github.com/tkemza
                          Writed in: Bash (Shell Script)

                          Special thanks to:
                          Whole Zbyte organization!"

            for (( i=0; i<${#tnk_msg}; i++)); do 
                echo -n "${tnk_msg:$i:1}" | lolcat 
                sleep 0.006
            done 
            echo # Making space
            echo # Making spcae 
            echo # Making space
            echo # Making spcae 
            echo # Making space
            echo # Making spcae 
            echo # Making space
            echo # Making spcae 
            read -p "(Press enter to go back to main menu)" button
            if [[ $button == "" ]]; then
                clear
                menu_win
            else    
                echo 
                echo 
                read -p "Did you wanted to press enter to go back to main menu? (Y/n)" yesno
                if [[ $yesno == "y" || $yesno == "Y" ]]; then
                    clear 
                    menu_win
                else
                    clear
                    menu_win
                fi 
            fi 
            ;;
        00 | 0)
            echo 
            printf "${RED}[${WHITE}!${RED}]${RED} Tool aborted.${RESETBG}"
            echo 
            sleep 0.8
            exit 0
            ;; 
        *)
            echo 
            printf "${RED}[${WHITE}!${RED}]${RED} Invalid input."
            echo 
            sleep 0.8
            clear 
            menu_win
            ;;
    esac
}

menu_win