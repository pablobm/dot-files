set nocompatible
set encoding=utf-8

"
" Things that need to come before
"
let g:instant_markdown_slow = 1

"
" Configuration for Vundle
"
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'

Plugin 'nanotech/jellybeans.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-powerline'
Plugin 'pablobm/ack.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'juvenn/mustache.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'cakebaker/scss-syntax.vim'

call vundle#end()
filetype plugin indent on


"
" Powerline
"
set laststatus=2   " Always show the statusline

"
" CtrlP
"
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" Additionally, it will also ignore files listed in `wildignore`

"
" ack.vim
"
let g:ackargs="-H --nocolor --column --ignore-dir=node_modules"

"
" vim-coffee-script
"
" On a Mac: Alt+Shift+D
:nmap Î :CoffeeCompile<CR>

"
" NERDTree
"
:nmap <Leader>t :NERDTreeToggle<CR>
:nmap <Leader>T :NERDTreeFind<CR>

"
" fugitive.vim
"
:nmap <Leader>gs :Gstatus<CR>

"
" NERDCommenter
"
map <leader>/ <plug>NERDCommenterToggle<CR>

"
" RSpec.vim
"

map <Leader>r :call RunCurrentSpecFile()<CR>
map <Leader>R :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
"map <Leader>a :call RunAllSpecs()<CR>


"
" Misc
"

syntax enable
colorscheme jellybeans

" Allow backspace at start of insert http://blog.sanctum.geek.nz/vim-annoyances/
set backspace=indent,eol,start

" Remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" Highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Ignore certain file types
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Show line numbers
set nu

" Indent with 2 spaces
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" Incremental search
set incsearch

" Be smart about case sensitiveness
set smartcase
"/copyright      " Case insensitive
"/Copyright      " Case sensitive
"/copyright\C    " Case sensitive
"/Copyright\c    " Case insensitive

" gitx shortcut
:nmap <Leader>gx :!gitx<CR><CR>

" Autocomplete with TAB (tab with Shift+TAB)
:imap <Tab> <C-n>
