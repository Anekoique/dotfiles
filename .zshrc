eval "$(starship init zsh)"
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export ALL_PROXY=http://127.0.0.1:7897
export HTTP_PROXY=http://127.0.0.1:7897
export HTTPS_PROXY=http://127.0.0.1:7897

export PATH=/opt/homebrew/bin:$PATH

# alias gcc='gcc-15'
# alias g++='g++-15'
alias vi='nvim'
alias vim='nvim'
alias cf="cd ~/Library/Application\ Support/"
alias zsh="vi ~/.zshrc"

export PATH=/usr/local/opt/riscv-gnu-toolchain/bin:$PATH
export PATH=/opt/riscv64-linux-musl-cross/bin:$PATH
export PATH=/opt/loongarch64-linux-musl-cross/bin:$PATH
export PATH="$(brew --prefix gnu-sed)/libexec/gnubin:$PATH"

template() {
  local string=$1
  if [ -z $string ]; then
    echo error!
    return 1
  fi
  mkdir -p ./${string}/template
  mkdir -p ./${string}/problems
}

bindkey "^[[A" history-beginning-search-backward
bindkey "^[OA" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "^[OB" history-beginning-search-forward
