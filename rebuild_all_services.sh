#!/bin/bash
echo "Script Started"
SERVICES=sw-ticket-initialise-service
for i in $(echo $SERVICES | sed "s/,/ /g")
do
    echo "service:$i"
    cd $i
    if [ -z "$(git status --porcelain)" ]; then 
        echo "working directory is clean"
        echo ""
        git stash save tmpSaveForRebuild
    else 
        echo "Uncommitted changes"
        echo ""
        git stash save tmpSaveForRebuild
    fi
    git checkout master
    git pull origin master
    git commit --allow-empty -m "trigger build"
    git push origin master
    cd ..
    read  -n 1 -p "continue:" mainmenuinput
done
