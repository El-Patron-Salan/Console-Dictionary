#!/usr/bin/env bash

# Handle errors
set -e
set -u

# Print help menu
Help(){
    echo "Check definition of given word"
    echo
    echo "Usage: condict [-h|s|p|P]  [word ..]         get definition and an example of word"
    echo
    echo "Arguments:"
    echo "  -h      show this help"
    echo "  -s      list 5 synonyms"
    echo "  -p      part of speech"
    echo "  -P      phonetic"
    echo "  -V      show version"
    echo
    echo "DM me if you've some other features in mind -> El Patron Salan#6684"
    echo
}