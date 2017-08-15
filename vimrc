set nocompatible
" Added pathogen
execute pathogen#infect()

" Props to Gary Bernhardt for color scheme
:set t_Co=256 " 256 colors
:set background=dark
:color grb256

syntax enable
set encoding=utf-8
set showcmd
filetype plugin indent on

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start

set hlsearch
set incsearch
set ignorecase
set smartcase

set nobackup
set nowritebackup
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

let mapleader = ","

" No Help, please
nmap <F1> <Esc>
set number
set numberwidth=5

" Selecta, see:  https://github.com/garybernhardt/selecta
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | ~/bin.pub/selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>

nnoremap <leader>e :%Eval<cr>
nnoremap <leader>r :RunTests<cr>
