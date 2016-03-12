#/bin/sh

GITHUB_URL = "https://github.com/oshou"
DOTPATH = "~/.dotfiles"
DOTREMOTEPATH = "https://github.com/oshou/dotfiles/archive/master.tar.gz"

if has "git";then
  git clone --recuresive "$GITHUB_URL" "$DOTPATH"
elif has "curl" || has "wget";then
  tarball = "$DOTREMOTEPATH"
  if has "curl";then
    curl -L "$tarball"
  elif has "wget";then
    wget -O - "$tarball"
  fi | tar xv -

  mv -f dotfiles-master "$DOTPATH"
else
  die "curl or wget required"
fi

cd ~/.dotfiles
if [$? -ne 0 ];then
  die "not found: $DOTPATH"
fi

for f in .??*
do
  [ "$f" = ".git" ] && continue
  ln -snfv "$DOTPATH/$f" "$HOME/$f"
done
