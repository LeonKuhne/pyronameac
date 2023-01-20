#!/bin/bash

# file locations
if [ -z "$PYRO_REGEX" ]; then
  PYRO_REGEX=~/.config/pyro/pyro.regex
fi
if [ -z "$PYRO_CONFIG" ]; then
  PYRO_CONFIG=.pyro
fi

# define delimiter
IFS=': '
PYFILE="$1.py"
PYROFILE="$1.pyro"

# fancy print: "Transpiling [filename.pyro]."
tput setaf 3 && echo -n "Transpiling "
tput setaf 6 && echo -n "$PYROFILE"
tput setaf 3 && echo "."

# copy the file to .py
if test -f $PYFILE; then
  rm $PYFILE
fi

cp $PYROFILE $PYFILE

# print details header
if [[ $* == *-d* ]]; then
  echo "Replacing..."
fi

# go through every line in the .pyro file
cat $PYRO_CONFIG | while read line; do

  # check if line is empty
  if [ ! -z "$line" ]; then

    # separate into key/value
    read key val <<< "$line"


    if [[ $* == *-d* ]]; then # print details
      tput setaf 6 && echo -ne "  $val"
      tput setaf 3 && echo -n " > "
      tput setaf 6 && echo $key
      tput setaf 3
    fi

    # go through every line in the [name].pyro file
    # if theres a match, then replace
    regex=$($PYRO_REGEX $key $val)
    sed -E -i "" "$regex" $PYFILE

  fi
done

# run the file
if [[ $* != *-c* ]]; then
  echo "Running..."
  tput setab 0 && tput setaf 7 && echo "> python $PYFILE" && tput setaf 9
  python $PYFILE $2
fi




