prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    #prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}
#cat $(dirname "$0")/.zsh_aliases
if [[ -f $(dirname "$0")/.zsh_aliases ]]; then

  source $(dirname "$0")/.zsh_aliases

fi
