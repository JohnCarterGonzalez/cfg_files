# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="my-theme"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"


plugins=(git)

source $ZSH/oh-my-zsh.sh

# My configuration
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

alias notes='/usr/bin/git --git-dir=$HOME/.notebook/ --work-tree=$HOME'

# App Aliases 
alias vi="nvim"
  
# Config Aliases 
alias vimrc="nvim ~/.vimrc"
alias zshrc="nvim ~/.zshrc"
alias nvrc="nvim ~/.config/nvim/init.vim"

# Docker aliases
alias dcb="docker-compose build"
alias dce="docker-compose exec"
alias dcl="docker-compose logs"
alias dcps="docker-compose ps"
alias dcu="docker-compose up"
alias dcud="docker-compose up -d"
alias dcd="docker-compose down"
alias dcs="docker-compose stop"
alias dcud-f="docker-compose up -d --force-recreate"
alias dsp="docker system prune"

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"

export BAT_THEME="ansi"
export LC_ALL="en_US.UTF-8"
eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_TMUX_OPTS='-p80%,60%'
# Preview file content using bat
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
 
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
export FZF_DEFAULT_OPTS="
	--color=fg:$subtle,bg:$base,hl:$rose
	--color=fg+:$text,bg+:$overlay,hl+:$rose
	--color=border:$highlightMed,header:$pine,gutter:$base
	--color=spinner:$gold,info:$foam,separator:$highlightMed
	--color=pointer:$iris,marker:$love,prompt:$subtle"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

export PATH="$PATH:$HOME/.rvm/bin"
alias config='/usr/bin/git --git-dir=/Users/cpt_n3m0/.cfg/ --work-tree=/Users/cpt_n3m0'

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libpq/lib/pkgconfig"
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"
