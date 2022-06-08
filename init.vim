call plug#begin()
" installed in directory, ~/.local/share/nvim/plugged/
Plug 'tpope/vim-sensible'
call plug#end()

set nocompatible

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on

set mouse=a
filetype plugin indent on
set backspace=indent,eol,start
setlocal colorcolumn=100
let $RTP=split(&runtimepath, ',')[0]

set path=.,**

set background=light

map <C-K> :py3f ~/.config/nvim/clang-format.py<cr>
imap <C-K> <c-o>:py3f ~/.config/nvim/clang-format.py<cr>

function! Formatonsave()
  let l:formatdiff = 1
  py3f ~/.config/nvim/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp,*.c call Formatonsave()
