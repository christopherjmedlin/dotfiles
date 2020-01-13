
export PATH="$HOME/.cargo/bin:$HOME/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

export VISUAL="vim"
export EDITOR="$VISUAL"


if [[ ! ${DISPLAY} && ${XDG_VTNR} == 1 ]]; then
    exec startx
fi
