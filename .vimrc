" For Vundle settings
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" self
Bundle 'gmarik/vundle'

" Vundle Install
Bundle 'SuperTab'

" github plugin
  " vim plugins
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'tpope/vim-markdown'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'elzr/vim-json'
Bundle 'LeafCage/yankround.vim'

  " python plugins
Bundle 'JumpeiArashi/jedi-vim'
Bundle 'The-NERD-tree'
Bundle 'python.vim'
Bundle 'vim-flake8'

  " ruby(chef) plugins
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "vadv/vim-chef"

  " javascript plugins
Bundle "jelera/vim-javascript-syntax"
Bundle "jQuery"

  " coffee script plugins
Bundle "kchmck/vim-coffee-script"

  " handlebars plugin
Bundle "mustache/vim-mustache-handlebars"

  " less plugin
Bundle "groenewege/vim-less"

" End of Vundle settings
filetype plugin indent on

" own vim settings
" brew unsintall vim; brew install vim For Mac User
syntax on
set autoindent
set ambiwidth=double
set backspace=indent,eol,start
set bg=dark
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set hlsearch
set ignorecase
set number
set tabstop=4
set termencoding=utf-8
set cursorline
highlight CursorLine term=None cterm=None ctermbg=darkgray ctermfg=None

" yankround
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |

" NERD-Tree
nmap <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" For Python
autocmd BufNewFile *.py 0r $HOME/.vim/templates/python
autocmd BufNewFile *.py 3
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4

"" For htmldjango
"autocmd FileType htmldjango setl autoindent expandtab tabstop=2 shiftwidth=2 softtabstop=2
"autocmd FileType htmldjango setl indentexpr=""
"
" For html
autocmd FileType html setl autoindent expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html setl indentexpr=""

" handlebers
autocmd FileType html.handlebars setl autoindent expandtab tabstop=2 shiftwidth=2 softtabstop=2

" For javascript
autocmd FileType javascript setl autoindent expandtab tabstop=2 shiftwidth=2 softtabstop=2

" For markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.mkd,*.markdown setlocal ft=ghmarkdown
augroup END
  " Shortcut to open Marked
noremap <C-w>m :<C-u>silent !open -a Marked "%:p"<CR>

" For salt *.sls
autocmd BufNewFile,BufRead *.sls set ft=yaml
autocmd FileType yaml set tabstop=2 shiftwidth=2 softtabstop=2

" For vim-chef
autocmd FileType ruby,eruby setl autoindent expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType ruby,eruby set filetype=ruby.eruby.chef

" json
autocmd FileType json set tabstop=2 shiftwidth=2 softtabstop=2
let g:vim_json_syntax_conceal = 0

" For coffeescript
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et
autocmd QuickFixCmdPost * nested cwindow | redraw! 
autocmd FileType coffee nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h

" For less
autocmd FileType less setl autoindent expandtab tabstop=2 shiftwidth=2 softtabstop=2
