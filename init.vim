call plug#begin()
" installed in directory, ~/.local/share/nvim/plugged/
Plug 'tpope/vim-sensible'
Plug 'nisavid/vim-colors-solarized'
Plug 'equalsraf/neovim-gui-shim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'inkarkat/vim-mark', { 'branch': 'stable' }
Plug 'inkarkat/vim-ingo-library', { 'branch': 'stable' } 
Plug 'pseewald/vim-anyfold'
call plug#end()

" --- General settings ---
let mapleader = "\\" "pressing \ should work as a leader now

set nocompatible
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
syntax enable

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set laststatus=2
"set relativenumber
set undofile

:highlight Cursorline cterm=bold ctermbg=black

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set mouse=a

set wrap
set textwidth=79
"https://vimhelp.org/change.txt.html?#fo-table
"https://vi.stackexchange.com/questions/1983/how-can-i-get-vim-to-stop-putting-comments-in-front-of-new-lines 
set formatoptions=qrn1
set colorcolumn=85

set background=dark
colorscheme solarized

filetype plugin indent on
let $RTP=split(&runtimepath, ',')[0]

"To enable the automatic restore of marks from a previous Vim session:
let g:mwAutoLoadMarks = 1
"toggling all marks and :MarkClear command
nmap <Leader>M <Plug>MarkToggle
nmap <Leader>N <Plug>MarkAllClear

set path=.,**

map <C-K> :py3f ~/.config/nvim/clang-format.py<cr>
imap <C-K> <c-o>:py3f ~/.config/nvim/clang-format.py<cr>

function! Formatonsave()
  let l:formatdiff = 1
  py3f ~/.config/nvim/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp,*.c call Formatonsave()
":set gfn=* will bring the font list then can do :set guifont to see the actual command
set guifont=DroidSansMono\ NF:h11
"let g:neovide_refresh_rate=60

autocmd Filetype * AnyFoldActivate               " activate for all filetypes
set foldlevel=0  " close all folds
autocmd User anyfoldLoaded normal zv
let g:LargeFile = 100000 " file is large if size greater than 0.1MB
autocmd BufReadPre,BufRead * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
function LargeFile()
    augroup anyfold
        autocmd! " remove AnyFoldActivate
        autocmd Filetype <filetype> setlocal foldmethod=indent " fall back to indent folding
    augroup END
endfunction

augroup remember_folds
  autocmd!
" views are saved in ~/.local/share/nvim/view/
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

lua << END
require('lualine').setup{
      options = { theme = 'auto' }
}
END
