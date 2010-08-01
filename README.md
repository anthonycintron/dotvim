# What

Vim configuration files and plugins. For the most part these have been pulled from the excellent Vim screencasts at Peepcode.

## Before installing

Move any existing ~/.vimrc and ~/.gvimrc files to another location, if you want to keep their contents. The installer will write over these locations without asking questions.

# Installation

Clone this repository to ~/.vim

    git clone git://github.com/grillpanda/vim.git ~/.vim

Then run the installer

    cd ~/.vim
    rake vim:install

Or, if you’re without a ruby installation

    cd ~/.vim
    git submodule init && git submodule update
    ln -sf vimrc ~/.vimrc
    ln -sf gvimrc ~/.gvimrc

# Those screencasts

* [Peepcode – Smash Into Vim](http://peepcode.com/products/smash-into-vim-i)
* [Peepcode – Smash Into Vim II](http://peepcode.com/products/smash-into-vim-ii)
