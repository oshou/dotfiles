#/bin/sh

export DOTPATH="~/.dotfiles"
export ARCHIVEPATH="~/.dotfiles/archive/master.tar.gz"
export GITHUB_URL="https://github.com/oshou"

if has "git"; then
  git clone --recuresive "https://github.com/oshou/dotfiles/archive/master.tar.gz"
elif has "curl" || has "wget";then
  tarball = "$GITHUB_URL/$ARCHIVEPATH"
  if has "curl"; then
    curl -L "$tarball"
  elif has "wget"; then
    wget -O - "$tarball"
  fi | tar xv -

  mv -f dotfiles-master "$DOTPATH"
else
  die "curl or wget required"
fi

cd ~/.dotfiles
if [ $? -ne 0 ];then
  die "not found: $DOTPATH"
fi

for f in .??*
do
  [ "$f" = ".git" ] && continue
  ln -snfv "$DOTPATH/$f" "$HOME/$f"
done
