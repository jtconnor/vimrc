" vim-plug, per: https://github.com/junegunn/vim-plug"
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'nvie/vim-flake8'
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go'
Plug 'ervandew/supertab'

" solarized colorscheme
Plug 'altercation/vim-colors-solarized'

" find files
Plug 'ctrlpvim/ctrlp.vim'

" jump to file locations via letters
Plug 'easymotion/vim-easymotion'

" Initialize plugin system
call plug#end()

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
nnoremap <unique> <Leader>f :call Flake8()<CR>

" Go format, which auto-formats go code.
nnoremap <unique> <Leader>g :GoFmt<CR>
" Use goimports instead of gofmt for go-formatting b/c goimports does
" everything that gofmt does + canonicalizes imports.
let g:go_fmt_command = "goimports"

" Terraform format, which auto-formats terraform config.
nnoremap <unique> <Leader>t :call terraform#fmt()<CR>

" Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
" Find one char
" nmap <Leader>f <Plug>(easymotion-overwin-f)
" Find two chars
nmap <Leader>f <Plug>(easymotion-overwin-f2)
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

if has('gui_running')
    syntax enable
    set background=light
    colorscheme solarized
endif
