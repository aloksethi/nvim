"g:solarized_termcolors=256
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1

syntax enable
set background=light
colorscheme solarized

" Enable Mouse
set mouse=a

GuiAdaptiveColor 1
"GuiTreeviewShow

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

