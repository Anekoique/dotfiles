if status is-interactive
    export GPG_TTY=$(tty)
    # Commands to run in interactive sessions can go here
end

alias vi='nvim'
alias vim='nvim'

alias vide='neovide'
alias bashrc='nvim ~/.bashrc'
alias hypr='nvim ~/.config/hypr/hyprland.conf'
eval "$(/home/ctoluu/miniconda3/bin/conda shell.fish hook)"
set -x JAVA_HOME "/usr/lib/jvm/java-17-openjdk"
fish_add_path $JAVA_HOME/bin
bass source /usr/share/nvm/init-nvm.sh

