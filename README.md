# dotfiles

My dotfiles

## NeoVundle

clone neo vundle.

```bash
$ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

Execute `:NeoBundleInstall` command on your vim.

## tpm

install tpm

```bash
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

And proceed `prefix + I` on any tmux session to install each plugins

## homebrew

I use [Brewfile](https://github.com/Homebrew/homebrew-bundle)

```bash
$ cp .brewfile ${HOME}/
$ brew bundle --file=.brewfile
```

## restore dotfiles

I use [mackup](https://github.com/lra/mackup).

```bash
$ cp -ar .mackup* ${HOME}/ 
$ mackup restore
# after restoreing
$ rm -r ${HOME}/.mackup*
```
