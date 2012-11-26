"
" File:		.vimrc
"
" Maintainer:	Szeredi Tibor Zoltan <zownix@gmail.com>
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
set relativenumber

if has("mouse")
	set mouse=a
endif

if v:version>=703
	set colorcolumn=+1
endif

if has("gui_running")
	set guioptions-=T
	set guioptions-=m
	set guioptions-=r
	set columns=160
	set lines=50
	colo darkblue
else
	colo desert
endif

function DjangoTags()
"	tabnew ~/Source/django/docs/intro
	set tags+=~/Source/django/tags
endfunction

function SetCommands()
	command DjangoMode call DjangoTags()
endfunction

syntax on
filetype indent plugin on
autocmd FileType python set ts=4 sw=4 bs=2 et
autocmd FileType cpp set ts=2 sw=2 bs=2 et
autocmd FileType text set cc=0

call SetCommands()
