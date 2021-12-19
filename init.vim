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



"syntax enable "resalta la sintaxys
syntax on "resalta la syntaxys
color blue



set t_Co=256

call plug#begin()

 Plug 'dikiaap/minimalist'
 Plug 'easymotion/vim-easymotion'
 Plug 'christoomey/vim-tmux-navigator'
 Plug 'scrooloose/nerdtree'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'mattn/emmet-vim'
 Plug 'gko/vim-coloresque'
 Plug 'prettier/vim-prettier', { 'do': 'yarn install' } "(:Prettier)

call plug#end()

"Temas
colorscheme minimalist

"IDE
let mapleader=" " "Mapea una tecla, los demas comandos usan esta tecla
"easymotion Ctrl + h,j,k,l
nmap <Leader>s <Plug>(easymotion-s2)
"neerdtree m=menu
nmap <Leader>nt :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1 "Para que se cierre una vez que habra el archivo	
"emmet
let g:user_emmet_leader_key=',' ",, div>p>a, myname, etc



"ATAJOS
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
:imap  jj <Esc>
