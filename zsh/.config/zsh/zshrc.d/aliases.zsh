alias -g L="| ${PAGER:-less}"
alias -g G='| grep --color'
alias -g W='| wc'
alias -g ∃='2> /dev/null'
alias -g ∀='> /dev/null 2>&1'
alias -g Σ="' '"

alias -g TODAY='${(%):-"%D{%Y%m%d}"}'
alias -g TODAYH='${(%):-"%D{%Y-%m-%d}"}'
alias -g NOW='${(%):-"%D{%H%M%S}"}'
alias -g NOWH='${(%):-"%D{%H:%M:%S}"}'

alias -g ::='$_'
alias -g :::='$_:h'

alias ,='popd'

# -- shorties --

alias l=${PAGER:-less}
alias m='man'
alias n='nvim'
alias o='rifle'
alias p='print'
alias g='noglob git'
alias t='tmux'
alias ta='tmux attach -t'

alias  ls='ls -khF --group-directories-first --color=auto'
alias lsl='ls -l'
alias  la='ls -A'
alias lal='ls -lA'
alias  lA='ls -a'

alias ff='noglob find . -type f -name'
alias fd='noglob find . -type d -name'

alias nan="MANPAGER=\"nvim -n '+set ft=man' -\" man"

alias taghere='touch .tags'

alias rs='rsync --recursive --perms --owner --group --human-readable'
