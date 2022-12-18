
if [ -d "$HOME/.local/bin" ]; then
    export PATH="$PATH:$HOME/.local/bin"
fi

if [ -d "$HOME/.myscripts" ]; then
    export PATH="$PATH:$HOME/.myscripts"
fi

# ocaml
if [ -d "$HOME/.opam" ]; then
    eval $(opam env)
fi


#export MYLIBS="/home/scouarn/mylibs"
#export C_INCLUDE_PATH="$C_INCLUDE_PATH:$MYLIBS/include"
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$MYLIBS/lib"
#export LIBRARY_PATH="$LIBRARY_PATH:$MYLIBS/lib"

if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi 

# Auto WM on tty1
if [ -z "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    if [ -f "$HOME/.xinitrc" ]; then
        exec startx
    elif [ -x "$HOME/start_desktop" ]; then
        exec "$HOME/start_desktop"
    fi
fi
