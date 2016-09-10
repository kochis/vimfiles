#!/bin/bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
ln -s ~/.vim/eslintrc.json ~/.eslintrc.json

vim +PluginInstall +qall

echo "Make sure the npm package 'eslint' is installed globally:"
echo "  npm install eslint -g"
