""
"" BEGIN Vundle
""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My plugins here:
Plugin 'tpope/vim-sensible'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
"Plugin 'tpope/vim-surround'
"Plugin 'walm/jshint.vim'
Plugin 'nvie/vim-flake8'
"Plugin 'fatih/vim-go'
"Plugin 'shmay/vim-yaml'
"Plugin 'kylef/apiblueprint.vim'
"Plugin 'hashivim/vim-terraform'
"Plugin 'Glench/Vim-Jinja2-Syntax'

" Display ctags in a pretty sidebar.
"Plugin 'majutsushi/tagbar'

" solarized colorscheme
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""
"" END Vundle
""

""
"" James added the below.
""
set expandtab  " Make <Tab> key insert spaces.
set tabstop=2  " Make tabs have 2 char width.
set shiftwidth=2  " 2-space indent.
set textwidth=79
set hlsearch  " Highlight search results.

" Case-insensitive search until enter caps.
set ignorecase
set smartcase

" Put hidden files into /tmp instead of current directory.  "//" makes vim use
" full path name for backup file.
set backupdir=/tmp//
set directory=/tmp//

" Map the Enter key (<CR>) so that pressing Enter toggles highlighting for the
" current word on and off.
let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction
nnoremap <silent> <expr> <CR> Highlighting()

let mapleader=","

" Disable beeping.
set noeb vb t_vb=

" NERDTree
nnoremap <unique> <Leader>n :NERDTreeToggle<CR>

" Flake8, which checks python style.
nnoremap <unique> <Leader>p :call Flake8()<CR>

" JSHint, which checks javascript style and (some) syntax.
nnoremap <unique> <Leader>j :JSHint<CR>

" Go format, which auto-formats go code.
nnoremap <unique> <Leader>g :GoFmt<CR>
" Use goimports instead of gofmt for go-formatting b/c goimports does
" everything that gofmt does + canonicalizes imports.
let g:go_fmt_command = "goimports"

if has('gui_running')
    syntax enable
    set background=light
    colorscheme solarized
endif
