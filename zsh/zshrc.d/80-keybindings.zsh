#!/bin/zsh

#autoload -Uz select-word-style
#select-word-style bash
WORDCHARS="?_-.~;!#$%^"

autoload backward-kill-word-match
zle -N backward-kill-word-match

autoload kill-word-match
zle -N kill-word-match

# Vim Mode
bindkey -v



helper=${ZDOTDIR}/zshrc.d/keys/${TERM}
if [[ $TERM =~ '^tmux-.*' ]]
then helper+="_${$(tmux show-environment -g TERM)#*=}"
fi

if [[ -f $helper ]]; then
	source $helper
	unset helper
else
	return
fi

[[ -n ${key[Backspace]} ]]    && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[C-Backspace]} ]]  && bindkey "${key[C-Backspace]}" backward-kill-word-match
#[[ -n ${key[Insert]} ]]       && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]]         && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]]       && bindkey "${key[PageUp]}" backward-word
[[ -n ${key[Delete]} ]]       && bindkey "${key[Delete]}" delete-char
[[ -n ${key[C-Delete]} ]]     && bindkey "${key[C-Delete]}" kill-word-match
[[ -n ${key[End]} ]]          && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]]     && bindkey "${key[PageDown]}" forward-word
[[ -n ${key[Up]} ]]           && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]]         && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]]         && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]]        && bindkey "${key[Right]}" forward-char

