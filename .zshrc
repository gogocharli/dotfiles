# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  github
  fnm
  eza
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

alias headers="httpstat"
alias zprofile="zed ~/.zprofile"
alias zshconfig="zed ~/.zshrc"
alias python="python3"
alias ip="ipconfig getifaddr en0"
alias cc="claude"

eval "$(op completion zsh)"
compdef _op op

# fnm  shell setup
eval "$(fnm env --use-on-cd --shell zsh)"

# export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"


# asdf escape hatch @see https://github.com/asdf-vm/asdf-nodejs#partial-and-codename-versions
# export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY=latest_installed

# tabtab source for packages
# uninstall by removing these lines
# [[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# python env
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# . "$HOME/.local/bin/env"

# google

gemini() {
  GEMINI_API_KEY="$(op read 'op://Business/GEMINI API KEY/credential')" \
    command gemini "$@"
}

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/superhi/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/superhi/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/superhi/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/superhi/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# bun completions
# [ -s "/Users/superhi/.bun/_bun" ] && source "/Users/superhi/.bun/_bun"

# bun
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"

# use starship theme
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/Users/bebop/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
