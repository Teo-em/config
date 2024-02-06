export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"
#favs: af-magic, avit, blinks, hafl-life, lambda

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

#### Alias ####

alias cdmus="cd ${HOME}/AX/music"
alias cdbot="cd ${HOME}/AX/venv/bot"
alias cls="clear;ls"
alias cdscripts="cd ${HOME}/AX/scripts"

cdl(){ cd $1;clear;ls; }
loop(){ cvlc -R $1 2&> /dev/null; }

run_bot() {
	source "${HOME}/AX/venv/bin/activate"
	python3 "${HOME}/AX/venv/bot/bot.py"
	deactivate
}

run_mantenimiento() {
	source "${HOME}/AX/venv/bin/activate"
	python3 "${HOME}/AX/venv/bot/mantenimiento.py"
	deactivate
}

