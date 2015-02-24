color molokai
" Evita la compatibilità con il vecchio vim
set nocompatible

set hidden

set t_Co=256

"Visualizza i numeri di riga
set number
set ruler
set cursorline
syntax on
set showmode

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"Rimappo il leader sullo spazio
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"



"Rimappo il tasto esc sulla jj
imap jj <Esc>
noremap ò <Char-0x60>

"rimappo i tasti per scrollare in su e in giù
map <Leader>j <C-d>
map <Leader>k <C-u>

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" Status bar
set laststatus=2


" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

"Mappo la riceca sulla virgola
map , /
map ,<Leader> :nohl<CR>

"Nasconde la barra dei menu e gli scrollbar
set guioptions=aAc


"Salva una vista ogni volta che chiudo un buffer per mantenere i fold
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview


"Imposta la modalità a tutto schermo
if has("gui_macvim")
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif

  set gfn=Liberation_Mono_for_Powerline
  let g:airline_powerline_fonts = 1

set scrolloff=8

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"invoco pathogen per la gestione dei plugin
call pathogen#infect()
call pathogen#helptags()

" load the plugin and indent settings for the detected filetype
filetype plugin indent on


"apro l'albero nella root del progetto
map <Leader>e :e.<cr>
"cambio il modo per incollare nel terminale"
map <silent> <Leader>p :set invpaste<cr>
imap <silent> <C-v> <Esc>:set invpaste<cr>i

inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap " ""<esc>i
inoremap < <><esc>i
inoremap [ []<esc>i
inoremap ' ''<esc>i




" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup


"Impostazioni per l'autocompletamento
set wildmode=longest:full
set wildmenu

"Sposta al tab successivo
noremap <silent> <C-tab> :tabnext <cr>

"Sposta al tab precedente
noremap <silent> <C-S-tab> :tabprev <cr>
"Sposta il cursore alla finestra precedente
noremap <silent> <tab> :wincmd w<cr>



"Sposta il cursore alla finestra successiva
noremap <silent> <S-tab> :wincmd W<cr>



autocmd BufWritePost ~/.vim/vimrc source $MYVIMRC

