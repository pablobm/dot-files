set nocompatible
set encoding=utf-8

"
" Configuration for Vundle
"
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'nanotech/jellybeans.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'pablobm/ack.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-markdown'
Bundle 'suan/vim-instant-markdown'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rails'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'juvenn/mustache.vim'
Bundle 'thoughtbot/vim-rspec'
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

"
" fugitive.vim
"
:nmap <Leader>gs :Gstatus<CR>


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

" gitx shortcut
:nmap <Leader>gx :!gitx<CR><CR>

" Autocomplete with TAB (tab with Shift+TAB)
:imap <Tab> <C-n>
