# places.sh (this file is intended to be sourced and not executed)
#
# Directory bookmarks (cd with a fuzzy finder)
#
# Usage:
# places                Prompt and cd
# places_prompt         Prompt and echo the selected path
# places_add [<path>]   Add to the list of paths, defaults to the current working directory
# places_rm             Prompt and remove from the list
#
# scouarn 01 Apr 2023
#

if [ ! -f "$PLACES_LIST" ]; then
    PLACES_LIST="$HOME/.myscripts/places.list"
fi

if [ -z "$PLACES_MENU" ]; then
    PLACES_MENU="fzf"
fi

places() {
    DIR=$(places_prompt)
    [ -d "$DIR" ] && cd "$DIR"
}

places_prompt() {
    cat "$PLACES_LIST" | $PLACES_MENU
}

places_add() {
    if [ -z "$1" ]; then
        DIR='.'
    elif [ -d "$2" ]; then
        DIR="$1"
    else
        echo "Invalid directory: $1" >&2
        exit 1
    fi

    DIR=$(realpath "$DIR")

    # Add and remove duplicates
    echo "$DIR" >> "$PLACES_LIST"
    sort -u "$PLACES_LIST" -o "$PLACES_LIST"
}

places_rm() {
    cat "$LIST" | grep -vxF "$(places_prompt)" > "$PLACES_LIST"
}
