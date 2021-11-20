#!/usr/bin/env bash

# Handle errors
set -e
set -u

# Initialize variables
given_word=""
json_queries=(
    '.[0].meanings[0].definitions[0].definition'
    '.[0].meanings[0].partOfSpeech'
    '.[0].phonetic'
    )

# Display help menu
Help(){
  echo "Check definition of given word"
  echo
  echo "Usage: condict [-h|s|p|P]  [word ..]         get definition and an example of word"
  echo
  echo "Arguments:"
  echo "  -s      list 5 synonyms"
  echo "  -p      part of speech"
  echo "  -P      phonetic"
  echo "  -h      show this help"
  echo "  -V      show version"
  echo
  echo "DM me through discord if you've some other features in mind -> El Patron Salan#6684"
  echo
}

# Display usage short menu
usage(){
  echo "Syntax: condict [-h|s|p|P]  [word ..]"
}

# Display definition of given word
get_definition(){
  curl --silent https://api.dictionaryapi.dev/api/v2/entries/en/$given_word | jq -r ${json_queries[0]}
}

# Return last argument which is word
for i in $@; do :; done
given_word=$i
# and display definition
get_definition

# TODO
while getopts ':pPsh:' flag; do
  case "${flag}" in

    p)

      ;;

    P)

      ;;  

    s) 
      
      ;;
    
    h) 
      echo
      Help
      exit
      ;;

    *) 
      echo "Invalid option: use -h"
      echo
      Usage
      exit;;
  esac
done

