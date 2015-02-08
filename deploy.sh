#! /bin/sh
# github auto-push script

git add .
read -p "Commit Message: " commitmessage
git commit -am "${commitmessage}"
git push origin master
