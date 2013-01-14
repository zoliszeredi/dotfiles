"
" File:		.vimrc
"
" Maintainer:	Szeredi Tibor Zoltan <zoltan.szeredi@3pillarglobal.com>
"
"

set nocompatible
set nowrap
set smartindent
set smarttab
set autoindent
set hlsearch
set ruler
set showcmd
set incsearch
set encoding=utf8
set textwidth=78

if has("mouse")
	set mouse=a
endif

if v:version>=703
"	set colorcolumn=+1
	set relativenumber
endif

if has("gui_running")
	set guioptions-=T
	set guioptions-=m
	set guioptions-=r
	set columns=160
	set lines=50
	colo darkblue
else
	colo evening
endif

function DjangoTags()
	set tags+=/usr/share/django.tags
endfunction

function PythonTags()
    set tags+=/usr/share/python.tags
endfunction

function SetCommands()
	command DjangoMode call DjangoTags()
	command PythonMode call PythonTags()
endfunction

syntax on
filetype indent plugin on
autocmd FileType python set ts=4 sw=4 bs=2 cc=+1 et
autocmd FileType cpp set ts=2 sw=2 bs=2 cc=+1 et
autocmd FileType html set ts=4 sw=4 bs=2 cc=+1 et
inoremap jk <esc>

call SetCommands()
