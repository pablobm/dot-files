set nocompatible
set encoding=utf-8


"
" Package management
" https://github.com/k-takata/minpac
"
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('Quramy/tsuquyomi')
call minpac#add('cakebaker/scss-syntax.vim')
call minpac#add('elixir-lang/vim-elixir')
call minpac#add('elmcast/elm-vim')
call minpac#add('isRuslan/vim-es6')
call minpac#add('kien/ctrlp.vim')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('mustache/vim-mustache-handlebars')
call minpac#add('dracula/vim', {'name': 'dracula-theme'})
call minpac#add('rking/ag.vim')
call minpac#add('scrooloose/nerdcommenter')
call minpac#add('scrooloose/nerdtree')
call minpac#add('w0rp/ale')
call minpac#add('tpope/vim-bundler')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-sensible')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('vim-scripts/spacehi.vim')
call minpac#add('wting/rust.vim')

call minpac#add('kassio/neoterm')
call minpac#add('janko-m/vim-test')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()


"
" Airline
"
let g:airline_theme='dracula'

"
" Ale
"
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_text_changed=1
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['autopep8'],
\}

"
" CtrlP
"
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules|bower_components)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" Additionally, it will also ignore files listed in `wildignore`

"
" Neoterm + vim-test
"
let g:neoterm_default_mod='vertical'
"let g:neoterm_size=50
"let g:neoterm_fixedsize=50
let g:neoterm_autoscroll=1

let test#strategy = "neoterm"
nnoremap <silent> <Leader>a :TestSuite<cr>
nnoremap <silent> <Leader>c :TestNearest<cr>
nnoremap <silent> <Leader>f :TestFile<cr>
nnoremap <silent> <Leader><Leader> :TestLast<cr>

"
" NERDTree
"
:nmap <Leader>t :NERDTreeToggle<CR>
:nmap <Leader>T :NERDTreeFind<CR>

"
" NERDCommenter
"
map <leader>/ <plug>NERDCommenterToggle<CR>

"
" Misc
"

syntax enable
packadd! dracula-theme
colorscheme dracula

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

" Treat JST templates as HTML
au BufNewFile,BufRead *.jst* set filetype=html

" diff
set diffopt=filler,vertical

" MacVim
set guifont=Inconsolata\ for\ Powerline:h14

" NeoVim :terminal
:tnoremap <Esc> <C-\><C-n>

" No annoying backup/swap files all over the place
set backupdir=~/.vim/backup/
set directory=~/.vim/swp/

" Markdown settings (builtin)
autocmd BufNewFile,BufReadPost *.md set filetype=markdown " *.md is Markdown, not Modula
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ruby', 'javascript']

" Terminal
autocmd TermOpen * setlocal scrollback=100000

