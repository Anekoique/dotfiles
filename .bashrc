#
# ~/.bashrc
#

# Alias
#
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
alias vi='nvim'
alias bashrc='nvim ~/.bashrc'
alias hypr='nvim ~/.config/hypr/hyprland.conf'


# Env
#
# Rust
export PATH="$HOME/.cargo/bin:$PATH"
# CXX
export CC=clang
export CXX=clang++
# Cross-compile
export PATH=$HOME/toolchain/x86_64-linux-musl-cross/bin:$PATH
export PATH=$HOME/toolchain/aarch64-linux-musl-cross/bin:$PATH
export PATH=$HOME/toolchain/riscv64-linux-musl-cross/bin:$PATH
export PATH=$HOME/toolchain/loongarch64-linux-musl-cross/bin:$PATH
# Go
export GOPATH="$HOME/toolchain/go/"
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"
# Ysyx
export PATH=$HOME/toolchain/oss-cad-suite/bin:$PATH
export NEMU_HOME=/home/ctoluu/ysyx/nemu
export NVBOARD_HOME=/home/ctoluu/ysyx/nvboard
export AM_HOME=/home/ctoluu/ysyx/abstract-machine
export NAVY_HOME=/home/ctoluu/ysyx/navy-apps
export ARCH=riscv32-nemu
export ISA=riscv32
# Vivado
source ~/toolchain/vivado/Xilinx/Vivado/2024.2/settings64.sh


# AI 
#
export GEMINI_API_KEY=AIzaSyDrg6O0xCLrGtmEYwlzlID1LFcseVlDIcY
export CLAUDE_BASH_NO_LOGIN=1

# Jump to fish
#
fish
