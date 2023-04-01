# places.sh (this file is intended to be sourced and not executed)
#
# Directory bookmarks (cd with a fuzzy finder)
#
# Usage:
# pl                    Prompt and cd
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

alias pl="eval cd \$(places_prompt)"

places_prompt() {
    cat "$PLACES_LIST" | $PLACES_MENU
}

places_add() {
    if [ -z "$2" ]; then
        DIR='.'
    elif [ -d "$2" ]; then
        DIR="$2"
    else
        echo "Invalid directory: $2" >&2
        exit 1
    fi
    DIR=$(realpath "$DIR")

    # Only add if not already in the list
    LINE=$(cat "$LIST" | grep -xF "$DIR")
    if [ -z "$LINE" ]; then
        echo "$DIR" >> "$PLACES_LIST"
    fi
}

places_rm() {
    cat "$LIST" | grep -vxF "$(places_prompt)" > "$PLACES_LIST"
}
