#!/usr/bin/env bash

# Handle error
set -e
set -u

# Initialize variables
given_word=""
# Output options
json_queries=(
    '.[0].meanings[0].definitions[0].definition'
    '.[0].meanings[0].definitions[0].synonyms[]'
    '.[0].meanings[0].partOfSpeech'
    '.[0].phonetic'
    )
json_queries_option=0

# Display help menu
Help(){
  echo "Check definition of given word"
  echo
  echo "Syntax: condict [-h|d|s|p|P]  [word ..]         get definition of word"
  echo
  echo "Arguments:"
  echo "  -d      definition of word"
  echo "  -s      list of synonyms"
  echo "  -p      part of speech"
  echo "  -P      phonetic"
  echo "  -h      show this help"
  echo
  echo "DM me through discord if you've some other features in mind -> El Patron Salan#6684"
  echo
}

# Display usage short menu
usage(){
  echo "Syntax: condict [-h|s|p|P]  [word ..]"
}

# Universal function for any dictionary query
get_api(){
  curl --silent https://api.dictionaryapi.dev/api/v2/entries/en/$given_word | jq -r ${json_queries[$json_queries_option]}
}

# catch_error(){
#   local title_contain="No Definitions Found"
#   check=$(curl --silent https://api.dictionaryapi.dev/api/v2/entries/en/$given_word | jq - '.title')
#   if [[ "$check" = "$title_contain" ]]; then
#     echo "$title_contain for '$given_word'"
#     exit 1;
#   fi
# }

# Get last argument
for i in "$@"; do true; done
given_word=$i

# Argument handler
while getopts 'dsPph' flag; do
  case "${flag}" in

    d)
      echo "Definition: $(get_api)"
      ;;

    s) 
      echo
      json_queries_option=1
      x=$(get_api)
      if [[ ${x} = "" ]]; then
        echo "Synonyms not found"

      else
        echo "Synonyms:"
        get_api
      fi
      ;;

    p)
      echo
      json_queries_option=2
      echo "Part of speech: $(get_api)"
      ;;

    P)
      echo
      json_queries_option=3
      echo "Phonetic: $(get_api)"
      ;;  
    
    h) 
      echo
      Help
      exit;;

    \?)
      echo
      echo "Invalid option: use -h"
      usage
      exit;;

    *) 
      echo
      echo "Invalid option: use -h"
      usage
      exit;;
  esac
done