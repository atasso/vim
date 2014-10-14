color desert
" Evita la compatibilità con il vecchio vim
set nocompatible

set hidden

if $TERM == "xterm-256color"
  set t_Co=256
endif

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
map <Leader><space> :nohl<CR>

"Rimappo il leader sulla virgola
let mapleader = ","
let g:mapleader = ","



"Rimappo il tasto esc sulla jj
imap jj <Esc>
noremap ò <Char-0x60>


" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" Status bar
set laststatus=2


" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?

"Nasconde la barra dei menu e gli scrollbar
set guioptions=aAc


"Salva una vista ogni volta che chiudo un buffer per mantenere i fold
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview


"Imposta la modalità a tutto schermo
if has("gui_macvim")
    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
    set gfn=Liberation_Mono_for_Powerline
    let g:airline_powerline_fonts = 1
endif


set scrolloff=8

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"invoco pathogen per la gestione dei plugin
call pathogen#infect()
call pathogen#helptags()

" load the plugin and indent settings for the detected filetype
filetype plugin indent on


" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>


inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap " ""<esc>i
inoremap < <><esc>i




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



autocmd BufWritePost vimrc source $MYVIMRC

