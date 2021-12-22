set number "muestra numeros
set mouse=a "deja interactuar con mouse
set numberwidth=1 "achica los numeros
set clipboard=unnamed "no usa el clipboar del sistema
set showcmd "muestra los comandos que hacemos
set ruler "muestra la fila, columna, porcentje, total
set encoding=utf8 "seteamos codificacion
set showmatch "muestra el cierre del parentesis 
set sw=2 "el tab son dos espacios
set relativenumber "numeros relativos a la linea
set laststatus=2 "muestra la barra de abajo
set noshowmode "no muestra el modo en el que nos encontramos
""set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
""set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and
":make
""set hidden		" Hide buffers when they are abandoned
set nocompatible "moverse con hjkl sin el miedo de entrar al modo de edicion (como en vi)
""set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME
set autoindent cindent smartindent showmatch "mantiene la identacion de la linea anterior
set nolist " No muestra los caracteres ocultos
"syntax enable "resalta la sintaxys
syntax on "resalta la syntaxys
color blue
set t_Co=256


" PUGLINS
call plug#begin()

 " Syntax (resaltado)
 Plug 'sheerun/vim-polyglot' "varios lenguajes
 
 " Status Bar
 "Plug 'vim-airline/vim-airline' "barra de abajo
 "Plug 'vim-airline/vim-airline-themes' "tema para la barra
 Plug 'itchyny/lightline.vim'
 Plug 'maximbaz/lightline-ale' "tema

 " Themes
 "Plug 'dikiaap/minimalist'
 Plug 'morhetz/gruvbox'
 Plug 'shinchu/lightline-gruvbox.vim'

 " Typing
 Plug 'alvan/vim-closetag' "cierra tags html, etc
 Plug 'chun-yang/auto-pairs' "cierra las llaves o corchetes

 " Autocomplete
 Plug 'neoclide/coc.nvim', {'branch': 'release'} "agrega autocompletado
 " Tmux
 Plug 'benmills/vimux'
 Plug 'christoomey/vim-tmux-navigator'
 
 " Navegation
 Plug 'scrooloose/nerdtree' "arbol para explorar
 Plug 'easymotion/vim-easymotion' "navegar por el archivo
 
 " Others
 Plug 'mhinz/vim-signify' "agrega + cuando se agrega una linea
 Plug 'yggdroot/indentline' "agrega linea de identado
 Plug 'scrooloose/nerdcommenter' "comenta la linea 
 Plug 'mattn/emmet-vim'
 Plug 'gko/vim-coloresque'
 Plug 'prettier/vim-prettier', { 'do': 'yarn install' } "(:Prettier)

call plug#end()


" SELECCIONAR TEMA
"colorscheme minimalist
colorscheme gruvbox
"let g:gruvbox_constrast_dark = "hard"

" MAPPING

let mapleader=" " "TeclaLider (solo en modo normal): Mapea una tecla, los demas comandos usan esta tecla

" Easymotion
nmap <Leader>s <Plug>(easymotion-s2)
" NerdTree
nmap <Leader>nt :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1 "Para que se cierre una vez que habra el archivo	
" Emmet
let g:user_emmet_leader_key=',' ",, div>p>a, myname, etc
" Others
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
:imap  jj <Esc>
" Shorter Commands
cnoreabbrev plugi PlugInstall
