" My .vimrc

"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------

" Backups & undo 
set backup		" keep a backup file (restore to previous version)
set backupdir=~/.local/share/vim/backup,/tmp
set undofile	" keep an undo file (undo changes after closing)
set undodir=/tmp

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" options to set always
set path+=**
set nospell
set showcmd
set nu
set rnu
set wildmenu
set expandtab
set shiftwidth=4
set tabstop=4
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=5
set sidescrolloff=5
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm

syntax on
filetype plugin indent on

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader = "ß"

" Allow gf to open non-existent files
map gf :edit <cfile><cr>
map gfe :edit <cfile><cr>
map gfv :vsplit <cfile><cr>
map gfs :split <cfile><cr>

" Escape to edit terminal
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif

" Quicker switching between windows
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" Open the current file in the default program
nmap <leader>x :!xdg-open %<cr><cr>

" Quicky escape to normal mode
imap jj <esc>

" Easy insertion of a trailing ; or , from insert mode
nmap ;; <Esc>A;<Esc>
nmap ,, <Esc>A,<Esc>


" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged/')
	source ~/.vim/plugin/vimplug.vim
call plug#end()

let g:airline#extensions#branch#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

  " unicode symbols
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ':'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

colorscheme dracula
set background=dark

" vim hardd mode

for k in ['<Left>','<Right>','<Up>','<Down>']
  exec 'nnoremap' k '<Nop>'
  exec 'vnoremap' k '<Nop>'
  exec 'inoremap' k '<Nop>'
endfor
