
if [ -d "$HOME/.local/bin" ]; then
    export PATH="$PATH:$HOME/.local/bin"
fi


if [ -d "$HOME/.myscripts" ]; then
    export PATH="$PATH:$HOME/.myscripts"
fi

#export MYLIBS="/home/scouarn/mylibs"
#export C_INCLUDE_PATH="$C_INCLUDE_PATH:$MYLIBS/include"
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$MYLIBS/lib"
#export LIBRARY_PATH="$LIBRARY_PATH:$MYLIBS/lib"

if [ -f "$HOME/bashrc" ]; then
    . "$HOMME/bashrc"
fi 

# Auto start X on tty1
if [ -f "$HOME/.xinitrc" ] && [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]
then
    exec startx
fi
