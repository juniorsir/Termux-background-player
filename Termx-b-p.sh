#!/data/data/com.termux/files/usr/bin/bash

# ANSI Escape Codes for Colors
BL='\e[01;90m'
R='\e[01;91m'
G='\e[01;92m'
Y='\e[01;93m'
LG='\e[01;37m'
N='\e[0m'
L='\033[7m'
X='\033[0m'

# Function to display header
print_header() {
    clear
    echo -e "${LG}------------------------------------------------${N}\n"
    }

# Function to update packages
update_packages() {
    echo -e "${Y}${L}\n Updating... \n${N}"
    pkg update && pkg upgrade -y
    clear
}

# Function to install Python and dependencies
install_python() {
    echo -e "${Y}${L}\n Installing python... ${N}"
    pkg install python -y
    pkg install python-pip -y
    clear
    sleep 0.2
}

# Function to install ffmpeg
install_ffmpeg() {
    echo -e "${Y}${L}\n Installing ffmpeg... \n${N}"
    pkg install ffmpeg -y
    clear
}

# Function to install mpv
install_mpv(){
     echo -e "${Y}${L}\n Installing mpv... \n${N}"
     pkg install mpv -y
     clear
}

# Function to install wget
install_wget() {
    echo -e "${Y}${L}\n Installing wget... \n${N}"
    pkg install wget -y
    clear
    sleep 0.2
}

# Function to install YouTube-dl
install_youtube_dl() {
    echo -e "${Y}${L}\n Installing YouTube-dl... \n${N}"
    pip install yt-dlp
    pip install yt-dlp -U
    clear
}

# Function to set up configurations
setup_configs() {
    echo -e "${Y}${L}\n Setting up configs..." $G" JuniorSir \n${N}"
    sleep 2
    echo -e "${Y}${L}\n Creating New music folder... \n${N}"
    mkdir -p ~/storage/shared/New music
    sleep 1.5
    echo -e "${Y}${L}\n Creating youtube-dl config... \n${N}"
    rm -rf ~/.config/yt-dlp
    mkdir -p ~/.config/yt-dlp
    sleep 1.5
    echo -e "${Y}${L}\n Getting config file... \n${N}"
    wget -q https://raw.githubusercontent.com/juniorsir/Termux-b-p/main/config -P ~/.config/yt-dlp
    cd ~/.config/yt-dlp || exit 1
    chmod +x config
    sleep 1
}

# Function to set up executable scripts
setup_executables() {
    echo -e "${Y}${L}\n Creating bin folder... \n${N}"
    mkdir -p ~/bin
    sleep 1.5
    echo -e "${Y}${L}\n Getting files...\n${N}"
    rm -rf ~/bin/Termux-background-player
    wget -q https://raw.githubusercontent.com/juniorsir/Termux-b-p/main/Termux-background-player -P ~/bin
    cd ~/bin || exit 1
    chmod +x Termux-background-player
    clear
}

# Main execution flow
main() {
    print_header
    update_packages
    print_header
    echo -e "${Y}${L}\n YouTube-dl Installer By" $G" JuniorSir \n${N}"
    install_python
    echo -e "${Y}${L}\n Installing ffmpeg... \n${N}"
    install_ffmpeg
    update_packages
    install_mpv
    install_wget
    install_youtube_dl
    setup_configs
    setup_executables
    echo -e "${Y}${L}\n Finishing configuration..." $G" JuniorSir \n${N}"
    sleep 3.5
    echo -e "${G}\n   Installation Finished...\n${N}"
    kill -1 $PPID
}

# Execute main function
main
