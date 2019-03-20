set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

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

" basic{{{1
syntax on
set autoindent                  " I hope you know what this does
set autowrite                   " automatically write before running commands that need it to be written
set hlsearch                    " turn on highlighting of searches
set ignorecase                  " make search non case sensitive
set incsearch                   " show the search result before you finish typing
set nowrap                      " do not wrap text to newline when it gets to the end of the screen
set noshowmode                  " turn off '--INSERT--' at bottom of screen
set shiftround                  " make indents always be at a multiple of the tab width
set showcmd                     " show normal mode commands that you are typing
set showmatch                   " when a bracket is inserted, briefly highlight the matching one.
set smartcase                   " allow you to search with more charters
set splitbelow                  " create new splits under current window
set splitright                  " create new vertical splits to the right
set timeout                     " set timeout for mappings
set notitle                     " stop Vim from setting the terminal's title
set ttyfast                     " makes Vim faster
set novisualbell                " disable screen flashes for error
set backspace=2                 " turn on backspace
set formatoptions+=w            " when text get over the number set by `set textwidth`, wrap it to next line
set foldmethod=marker           " set the folding method to use three { to start and three } to end
set laststatus=2                " always turn on status line
set modelines=5                 " number of lines down Vim checks for set commands
"set mouse=a                     " turn on the mouse
set scrolloff=7                 " make Vim have 7 lines below cursor when moving down
"set textwidth=80                " set what line to wrap charters at.
highlight ColorColumn ctermbg=green
call matchadd('ColorColumn', '\%81v', 100)
set ttimeoutlen=50              " change wait time for `timeout`
"set spell spelllang=en_us       " set language for spell check to United States
set clipboard=unnamedplus       " Vim yanks go to OS's clipboard as well
set number 			" line number
set relativenumber		" line on is 0
set linespace=0
" make Vim's clipboard the same as OS's clipboard
let g:clipbrdDefaultReg = '+'
" }}}

" status line{{{1
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermfg=4   ctermbg=15
    hi SLgreen    ctermfg=0 ctermbg=4
    hi SLblue     ctermfg=0 ctermbg=4
    hi SLcyan     ctermfg=0 ctermbg=4
  elseif a:mode == 'r'
    hi statusline ctermfg=9 ctermbg=15
    hi SLgreen    ctermfg=0 ctermbg=9
    hi SLblue     ctermfg=0 ctermbg=9
    hi SLcyan     ctermfg=0 ctermbg=9
  else
    hi statusline ctermfg=0 ctermbg=15
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermfg=0 ctermbg=15
au InsertLeave * hi SLgreen    ctermfg=2 ctermbg=0
au InsertLeave * hi SLblue     ctermfg=4 ctermbg=0
au InsertLeave * hi SLcyan     ctermfg=6 ctermbg=0

hi statusline ctermfg=0 ctermbg=15
hi SLgreen    ctermfg=2 ctermbg=0
hi SLblue     ctermfg=4 ctermbg=0
hi SLcyan     ctermfg=6 ctermbg=0

set statusline=%#SLblue#%f       " file name
set statusline+=%#SLgreen#\ %Y   " filetype
set statusline+=%#SLcyan#\ %M    " modified flag

set statusline+=\ %=             " move to right side

set statusline+=%#SLcyan#%p%%    " percent of file
set statusline+=%#SLgreen#\ %c   " column
set statusline+=%#SLblue#\ %l/%L " line/total lines
" }}}

" mapping{{{1
" make jj typed quickly while in insert mode switch to normal mode :D
inoremap jj <Esc>

" make ctrl+c completely like ESC
inoremap <C-c> <Esc><Esc>

" use jkl; instead of hjkl
noremap ; l
noremap l k
noremap k j
noremap j h
nnoremap h :
" pair completion{{{2
inoremap {        {}<Left>
inoremap {<CR>    {<CR>}<Esc>O
inoremap {<Space> {<Space><Space>}<Left><Left>
inoremap {{       {
inoremap {}       {}

inoremap (        ()<Left>
inoremap (<CR>    (<CR>)<Esc>O
inoremap (<Space> (<Space><Space>)<Left><Left>
inoremap ((       (
inoremap ()       ()

inoremap [        []<Left>
inoremap [<CR>    [<CR>]<Esc>O
inoremap [<Space> [<Space><Space>]<Left><Left>
inoremap [[       [
inoremap []       []

inoremap <>       <><Left>
inoremap ""       ""<Left>
inoremap ''       ''<Left>
inoremap ``       ``<Left>
inoremap `<CR>    ```<CR>```<Esc>O
inoremap $$       $$<Left>
inoremap %%       %%<Left>

inoremap /*       /*  */<Left><Left><Left>
" }}}
