# dotfiles
my development environment

## How to Intall

```
git clone https://github.com/nozdevel/dotfiles.git && cd dotfiles && source bootstrap.sh

or

cd; curl -#L https://github.com/nozdevel/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,.osx,MIT_LICENSE.txt}
```

## next
```
cd; cd .vim/dein; ./installer.sh .

chsh -s /bin/zsh

zsh

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

```


## refferences

- [dein](https://github.com/Shougo/dein.vim)
- [zplug](https://github.com/zplug/zplug)
