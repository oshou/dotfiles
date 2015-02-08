#! /bin/sh
# github auto-push script

echo "a"
git add .
echo "b"
read -p "Commit Message: " commit-message
git commit -am 'commit-message'
git push origin master
