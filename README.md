# nvim
contents of `.config/nvim` folder.
clang-format.py came from [github](https://github.com/llvm/llvm-project/blob/main/clang/tools/clang-format/clang-format.py)


## install
1) git clone the repo
2) in the .config directory, make a link `ln -s /datadisk/nvim/ nvim`
3) install the `vim-plug`, instructions are [here](https://github.com/junegunn/vim-plug#neovim)
4) open vim and do a `:PlugInstall'


## nerd font
```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
# Download the font, e.g.
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/DroidSansMono.zip
unzip DroidSansMono.zip
fc-cache -fv
```

To delete plugins with vim-plug, remove or comment out the Plug lines for the plugins you want to remove from your .vimrc (or init.vim) file. After saving the changes, reload your vimrc (:source ~/.vimrc) or restart Vim. Finally, run :PlugClean
