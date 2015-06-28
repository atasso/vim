" Evita la compatibilità con il vecchio vim
set nocompatible


" Required Vundle setup
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/Vundle.vim'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'honza/vim-snippets'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/ZoomWin'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/vimfiler.vim'
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/neosnippet.vim'
Bundle 'Shougo/neosnippet-snippets'

filetype on

" Fine delle impostazioni per Vundle

set background=dark
colorscheme solarized

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

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" Status bar
set laststatus=2

"Nasconde la barra dei menu e gli scrollbar
set guioptions=aAc

set gfn=Liberation_Mono_for_Powerline
let g:airline_powerline_fonts = 1

set scrolloff=8

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup


"Rimappo il leader sullo spazio
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

"Vimfiler è il filesistem di default
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_define_wrapper_commands = 1

"Impostazioni per l'autocompletamento e gli snippets
let g:neocomplete#enable_at_startup = 1
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
imap <expr><CR> pumvisible() ?
\(neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : neocomplete#close_popup())
\: "\<CR>"
imap <expr><TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"


"Rimappo il tasto esc sulla jj
imap jj <Esc>
noremap ò <Char-0x60>

"rimappo i tasti per scrollare in su e in giù
map <Leader>j <C-d>
map <Leader>k <C-u>

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

"Mappo la riceca sulla virgola
map , /
map ,<Leader> :nohl<CR>

"Mappature per unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file_rec,file_rec/async,buffer,grep',  'ignore_pattern', join(['\.sass-cache/', 'sass-extensions/'], '\|'))
nnoremap <Leader>f :Unite -start-insert file_rec/async<CR>
nnoremap <Leader>b :Unite -quick-match buffer <CR>
" Use ag for searching
let g:unite_source_grep_command = 'ack-grep'
let g:unite_source_grep_default_opts = '-i --no-heading --no-color -H'
let g:unite_source_grep_recursive_opt = ''
nnoremap <Leader>g :Unite grep:.<cr>

"apro l'albero nella root del progetto nella stessa finestra
map <Leader>e :VimFiler -toggle<cr>
map <Leader>t :VimFilerExplorer<cr>

"cambio il modo per incollare nel terminale"
map <silent> <Leader>p :set invpaste<cr>

inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap " ""<esc>i
inoremap < <><esc>i
inoremap [ []<esc>i
inoremap ' ''<esc>i

"Sposta il cursore alla finestra precedente
noremap <silent> <tab> :wincmd w<cr>
"Sposta il cursore alla finestra successiva
noremap <silent> <S-tab> :wincmd W<cr>

"Salva una vista ogni volta che chiudo un buffer per mantenere i fold
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview


"Imposta la modalità a tutto schermo
if has("gui_macvim")
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

autocmd BufWritePost ~/.vim/vimrc source $MYVIMRC
