
alias ytmp3="youtube-dl --extract-audio --audio-format mp3"
alias dcd="docker-compose down --remove-orphans"
alias dcu="docker-compose up -d"
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    #prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

if [ -f ~/.zsh_aliases ]; then

. ~/.zsh_aliases

fi
