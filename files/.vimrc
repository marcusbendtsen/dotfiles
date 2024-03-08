" -----------------------------------------------------------------------------------
" automatic vim.plug install 
"

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'jalvesaq/Nvim-R'
Plug 'ericbn/vim-solarized'

call plug#end()

" --------------------------------------------------------------------------------

let rout_follow_colorscheme = 1
let Rout_more_colors = 1

let R_rconsole_width = winwidth(0) / 2
autocmd VimResized * let R_rconsole_width = winwidth(0) / 2

" remapping the basic :: 
" imap , <Plug>RDSendLine
" imap , <Plug>RDSendSelection
" imap ,e <Plug>RESendSelection

"
" Cut, copy, paste
"
imap <C-k> <ESC>Di
nmap <C-k> <ESC>D

imap <C-y> <ESC>pi
nmap <C-y> <ESC>p


" Indentation
filetype indent on
set filetype=html
set smartindent
set shiftwidth=2
set softtabstop=4 expandtab


" Remap start and end of line shortcuts 
map <C-a> <ESC>^
imap <C-a> <ESC>I
map <C-e> <ESC>$
imap <C-e> <ESC>A

" Solarized
"syntax enable
"set background=dark
"colorscheme solarized






