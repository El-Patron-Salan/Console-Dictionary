#!/usr/bin/env bash

# Handle errors
set -e
set -u

# Print help menu
Help(){
    echo "Check definition of given word"
    echo
    echo "Usage: condict [arguments]  [word ..]         get definition and an example of word"
    echo
    echo "Arguments:"
    echo "  -s      list 5 synonyms"
    echo "  -p      part of speech"
    echo "  -P      phonetic"
    echo
    echo "DM me if you've some other features in mind -> El Patron Salan#6684"
    echo
}