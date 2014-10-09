vim.config
==========
1. rm -rf ~/.vimrc ~/.vim
2. git clone https://github.com/ifels/vim.config ~/.vim  
3. cd ~/.vim
4. git submodule update --init --recursive
5. cd ~/.vim/bundle/YouCompleteMe
6. ./install.sh --clang-completer
7. ln -s ~/.vim/.vimrc ~/.vimrc  

**done!**
