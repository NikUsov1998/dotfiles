# The following lines were added by compinstall
zstyle :compinstall filename '/home/nick/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch notify
unsetopt autocd beep extendedglob
bindkey -e
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[1;5C' backward-word
bindkey '\e[1;5D' forward-word
bindkey '\e[2~' overwrite-mode
bindkey '\e[3~' delete-char
# End of lines configured by zsh-newuser-install
# Включаем цвета
autoload -U colors && colors
export TERM=xterm-256color

# Настройка истории
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Алиасы для подсветки ls
alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -A'

# Плагин автоподсказок (серые подсказки)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Цвет подсказки (можно поменять, например, fg=8)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=242"

# Плагин подсветки синтаксиса (ДОЛЖЕН БЫТЬ ПОСЛЕДНИМ)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Кастомный промпт (как user@host:/path$ )
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f$ '
