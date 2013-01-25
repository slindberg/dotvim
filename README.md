Installing
---

Run from home directory:

```bash
# clone the repo
git clone git@github.com:slindberg/dotvim .vim

# link the repo's vimrc to .vimrc
ln -s ~/.vim/vimrc .vimrc

# create a system-specific .gvimrc that sources the repo version
echo 'source ~/.vim/gvimrc' > .gvimrc

# run make to initialize plugins, etc.
(cd .vim && make)
```
