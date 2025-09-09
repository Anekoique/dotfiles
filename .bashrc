#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# nvim
alias vim='nvim'
alias vi='nvim'

# faster edit
alias bashrc='nvim ~/.bashrc'
alias hypr='nvim ~/.config/hypr/hyprland.conf'

export PATH="$HOME/.cargo/bin:$PATH"
export CC=clang
export CXX=clang++
export PATH=$HOME/toolchain/x86_64-linux-musl-cross/bin:$HOME/toolchain/aarch64-linux-musl-cross/bin:$HOME/toolchain/riscv64-linux-musl-cross/bin:$HOME/toolchain/loongarch64-linux-musl-cross/bin:$PATH
export NEMU_HOME=/home/ctoluu/ysyx/nemu
export NVBOARD_HOME=/home/ctoluu/ysyx/nvboard
export AM_HOME=/home/ctoluu/ysyx/abstract-machine
export PATH=$HOME/toolchain/oss-cad-suite/bin:$PATH
export GEMINI_API_KEY=AIzaSyCcw426oZ5Q9UXHlx-ddY5YpLVTuXgnmX8
export GOPATH="$HOME/toolchain/go/"
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"
source ~/toolchain/vivado/Xilinx/Vivado/2024.2/settings64.sh
fish

