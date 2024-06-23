export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"
#favs: af-magic, avit, blinks, hafl-life, lambda
#plugins=(git)

source $ZSH/oh-my-zsh.sh

#### Alias ####

alias cdmus="cd $HOME/AX/music"
alias cdtom="cd $HOME/AX/venv/bots/tomcat/"
alias cdkarutag="cd $HOME/AX/venv/bots/karutag/"
alias cls="clear;ls"
alias cdscripts="cd $HOME/AX/scripts"
alias cdgit="cd $HOME/AX/git"
alias cdserver="cd /var/server/venv"
alias cdnvim="cd $HOME/.config/nvim/"
alias cddevops="cd $HOME/AX/estudio/devops/"
alias cdvag="cd $HOME/AX/estudio/devops/vagrant-vms/"
alias cdfin="cd $HOME/Orden/finales"

alias htbvpn="sudo openvpn $HOME/AX/estudio/htb/lab_teo730.ovpn"
alias music="cd $HOME/AX/music; xdotool key 5; cmus"

alias vimsx="vim $HOME/.config/sxhkd/sxhkdrc"
alias vimbsp="vim $HOME/.config/bspwm/bspwmrc"
alias vimzsh="vim $HOME/.zshrc"

alias rst="sudo reboot -h now"
alias sourcezsh="source $HOME/.zshrc"
alias pacup="sudo pacman -Syu"
alias nscan="sudo nmap -sC -sV"
alias pacinst="sudo pacman -S"
alias stayon="xset -dpms;xset s noblank;xset s off;"
alias redvenv="cd $HOME/AX/estudio/cybersec; source venv/bin/activate"
alias sync_status="watch -d grep -e Dirty: -e Writeback: /proc/meminfo"

alias std="shutdown -h now"

cdl(){ cd $1;clear;ls; }
loop(){ cvlc -R $1 2&> /dev/null; }
pacs(){ sudo pacman -S $1; source $HOME/.zshrc; }
pacrm(){ sudo pacman -Rnsc $1; }

bot_tom() {
    source "$HOME/AX/venv/bin/activate"
	python3 "$HOME/AX/venv/bots/tomcat/tomcat.py"
	deactivate
}

bot_karutag() {
    source "$HOME/AX/venv/bin/activate"
	python3 "$HOME/AX/venv/bots/karutag/karutag.py"
	deactivate
}


