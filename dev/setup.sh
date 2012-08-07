#!/bin/bash

if [[ -z $1 ]] || [[ -z $2 ]]; then
    echo "usage: dev/setup.sh projectname scriptname"
    exit
fi

find . -name "*.py" -or -name kapow | xargs sed -i "s/ungapatchka/$1/g;s/kapow/$2/g"
mv ungapatchka $1
mv kapow $2

# set up new git repo
rm -rf .git
git init . && git add . && git commit -m "first commit"

# reset version
python setup.py -h > /dev/null

