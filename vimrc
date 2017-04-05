" Evita la compatibilità con il vecchio vim
set nocompatible


" Required Vundle setup
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'vim-scripts/ZoomWin'
Plugin 'jiangmiao/auto-pairs'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/denite.nvim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Shougo/neoyank.vim'
Plugin 'scrooloose/syntastic'
Plugin 'gcorne/vim-sass-lint'
Plugin 'evidens/vim-twig'
Plugin 'majutsushi/tagbar'
Plugin 'joonty/vdebug'

filetype on

" Fine delle impostazioni per Vundle

set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

set hidden

set t_Co=256

"Visualizza i numeri di riga
set number
set relativenumber
set ruler
set cursorline
syntax on
set showmode
set fillchars=""
hi EndOfBuffer ctermfg=235
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
let g:airline#extensions#tabline#enabled = 1
let g:airline_inactive_collapse=1

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
let g:vimfiler_tree_leaf_icon = " "
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'
call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \})
augroup vfinit
autocmd FileType vimfiler call s:vimfilerinit()
augroup END
  function! s:vimfilerinit()
    set nonumber
    set norelativenumber
  endf

"Impostazioni per l'autocompletamento e gli snippets
let g:neocomplete#enable_at_startup = 1
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets, ~/.vim/bundle/neosnippet-snippets/neosnippets'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neosnippet#jumpable() ?
      \ "\<Plug>(neosnippet_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


"Rimappo il tasto esc sulla jj
imap jj <Esc>
noremap ò <Char-0x60>

"rimappo i tasti per scrollare in su e in giù
nnoremap <Leader>j <C-d>
nnoremap <Leader>k <C-u>
nnoremap è <C-o>
nnoremap é <C-i>

" ZoomWin configuration
nnoremap <Leader>z :ZoomWin<CR>

"Mappo la riceca sulla virgola
nnoremap , /
nnoremap ,<Leader> :nohl<CR>

"Mappature per denite
nnoremap [denite] <Nop>
nmap ò [denite]
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', 'v', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('normal', 's', '<denite:do_action:split>', 'noremap')
call denite#custom#map('normal', 'd', '<denite:do_action:delete>', 'noremap')
call denite#custom#source('line', 'matchers', ['matcher_fuzzy'])
nnoremap [denite]f :Denite file_rec<CR>
nnoremap [denite]l :Denite line<CR>
nnoremap [denite]b :Denite buffer -mode=normal<CR>
nnoremap [denite]y :Denite history/yank <CR>
nnoremap [denite]r :Denite -resume <CR>
noremap [denite]s :Denite grep<CR>

" impostazioni per syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_scss_checkers = ['sass_lint']
let g:syntastic_sass_checkers = ['sass_lint']
let g:syntastic_sass_checkers = ['sass_lint']
let g:syntastic_javascript_checkers = ['eslint']

"apro l'albero nella root del progetto nella stessa finestra
nnoremap <Leader>e :VimFiler -toggle<cr>
nnoremap <Leader>f :VimFilerExplorer<cr>

"cambio il modo per incollare nel terminale"
nnoremap <silent> <Leader>p :set paste<cr>
autocmd InsertLeave * set nopaste

"Sposta il cursore alla finestra precedente
noremap <silent> <tab> :wincmd w<cr>
"Sposta il cursore alla finestra successiva
noremap <silent> <S-tab> :wincmd W<cr>

nnoremap <CR> :
nnoremap à ;

nnoremap <Leader>tn :tabnew <cr>
nnoremap <Leader>tc :tabclose <cr>

"Imposta la modalità a tutto schermo
if has("gui_macvim")
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif


" Vdebug
let g:vdebug_keymap = {
\    "run" : "<Leader>1",
\    "run_to_cursor" : "<Down>",
\    "step_over" : "<Up>",
\    "step_into" : "<Left>",
\    "step_out" : "<Right>",
\    "close" : "q",
\    "detach" : "x",
\    "set_breakpoint" : "<Leader>b",
\    "eval_visual" : "<Leader>e"
\}

let g:vdebug_options = {
\    "break_on_open" : 0,
\}

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

autocmd BufWritePost ~/.vim/vimrc source $MYVIMRC


