  " Notes {{{
     " Originally I copied Robert Melton's vimfiles (https://github.com/robertmeta/vimfiles)
     " Got some also from Junegunn Choi (https://github.com/junegunn)
     " It changed a lot since then
  " }}}

  " Plugin Settings {{{
    " Using Junegunn Choi's junegunn/vim-plug plugin manager
    call plug#begin()

    " Load same default settings
    Plug 'tpope/vim-sensible'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'gregsexton/gitv'
    Plug 'airblade/vim-gitgutter'

    " tmux
    Plug 'tpope/vim-tbone'
    Plug 'tpope/vim-dispatch'

    " UI
    Plug 'mbbill/undotree',             { 'on': 'UndotreeToggle'   }
    Plug 'scrooloose/nerdtree'
    Plug 'majutsushi/tagbar'

    Plug 'altercation/vim-colors-solarized'
    Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

    " editing
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'junegunn/vim-easy-align',       { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
    Plug 'junegunn/vim-pseudocl' " prerequisite - pseudo command line
    Plug 'junegunn/vim-fnr' " advanced find and replace
    Plug 'junegunn/vim-oblique' " /-search improvements

    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary',        { 'on': '<Plug>Commentary' }

    Plug 'easymotion/vim-easymotion'
    Plug 'kien/ctrlp.vim'
    Plug 'mileszs/ack.vim'
    Plug 'Valloric/YouCompleteMe'

    Plug 'jiangmiao/auto-pairs' " auto close
    Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesToggle' }

    Plug 'maxbrunsfeld/vim-yankstack'
    Plug 'terryma/vim-multiple-cursors'

    Plug 'ConradIrwin/vim-bracketed-paste' " automatic set paste

    " lang
    Plug 'scrooloose/syntastic' " TODO: Needs integration with powerline
    Plug 'klen/python-mode'
    Plug 'pangloss/vim-javascript',  { 'for': 'javascript' }
    Plug 'kchmck/vim-coffee-script', { 'for': 'coffee'     }
    Plug 'plasticboy/vim-markdown',  { 'for': 'markdown'   }
    Plug 'wting/rust.vim',           { 'for': 'rust'       }
    Plug 'elzr/vim-json',            { 'for': 'json'       }
    Plug 'derekwyatt/vim-scala',     { 'for': 'scala'      }
    Plug 'hail2u/vim-css3-syntax',   { 'for': 'css'        }
    Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'jinja'      }
    Plug 'vim-perl/vim-perl',        { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }

    " don't forget to call() end, causes troubles -.-
    call plug#end()
  " }}}

  " Plugin settings {{{
    let g:tagbar_sort = 0
    let g:indentLine_enabled = 0
    let g:tcommentTextObjectInlineComment = ''
    let g:undotree_WindowLayout = 2
    nnoremap U :UndotreeToggle<CR>
    let g:vim_markdown_folding_disabled = 1


  " }}}

  " Plugin vim-gitgutter {{{
    nmap gh <Plug>GitGutterNextHunk
    nmap gph <Plug>GitGutterPrevHunk

    let g:gitgutter_realtime = 0
    let g:gitgutter_eager = 0
  " }}}

  " Plugin Rainbow Parentheses {{{
    " let g:rainbow_active = 1
    let g:rainbow#max_level = 16
    let g:rainbow#pairs = [['(', ')'], ['{', '}'], ['[', ']']]
    " List of colors that you do not want. ANSI code or #RRGGBB
    let g:rainbow#blacklist = [233, 234]
  " }}}

  " Plugin <Enter> | vim-easy-align {{{
    let g:easy_align_delimiters = {
    \ '>': { 'pattern': '>>\|=>\|>' },
    \ '\': { 'pattern': '\\' },
    \ '/': { 'pattern': '//\+\|/\*\|\*/', 'delimiter_align': 'l', 'ignore_groups': ['^\(.\(Comment\)\@!\)*$'] },
    \ ']': {
    \     'pattern':       '[[\]]',
    \     'left_margin':   0,
    \     'right_margin':  0,
    \     'stick_to_left': 0
    \   },
    \ ')': {
    \     'pattern':       '[()]',
    \     'left_margin':   0,
    \     'right_margin':  0,
    \     'stick_to_left': 0
    \   },
    \ 'f': {
    \     'pattern': ' \(\S\+(\)\@=',
    \     'left_margin': 0,
    \     'right_margin': 0
    \   },
    \ 'd': {
    \     'pattern': ' \(\S\+\s*[;=]\)\@=',
    \     'left_margin': 0,
    \     'right_margin': 0
    \   }
    \ }

    " Start interactive EasyAlign in visual mode
    vmap <Enter> <Plug>(EasyAlign)

    " Start interactive EasyAlign with a Vim movement
    nmap <Leader>a <Plug>(EasyAlign)
  " }}}

  " Plugin EasyMotion Minimal config {{{
    let g:EasyMotion_do_mapping = 0 " Disable default mappings

    " Bi-directional find motion
    " Jump to anywhere you want with minimal keystrokes, with just one key binding.
    " `s{char}{label}`
    nmap s <Plug>(easymotion-s)
    " or
    " `s{char}{char}{label}`
    " Need one more keystroke, but on average, it may be more comfortable.
    nmap s <Plug>(easymotion-s2)

    " Turn on case insensitive feature
    let g:EasyMotion_smartcase = 1

    " JK motions: Line motions
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
  " }}}

  " Basics {{{
    set encoding=utf-8
    set nocompatible

    set ttyfast
    set cpoptions=aABceFsmq

    set clipboard+=unnamed

    set backup
    set undofile
    set undolevels=1000
    set undoreload=10000
    set backupdir=~/.vim/backup
    set directory=~/.vim/tmp
    set undodir=~/.vim/undo
    set tags=./tags;/

    syntax on
    syntax sync minlines=100
  " }}}

  " General {{{
    let g:grepprg="ack -H --nocolor --nogroup --column"
    let g:skip_loading_mswin = 1

    " let mapleader="\<space>"

    set hidden " load files in the background
    set history=9999
    set autoread

    set noerrorbells " don't make noise
    set visualbell t_vb=

    set wildmode=list:longest,full " turn on wild mode huge list
    set wildignore=*.a,*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
    set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
    set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
    set wildignore+=*.luac " Lua byte code
    set wildignore+=migrations " Django migrations
    set wildignore+=*.orig " Merge resolution file
    set wildignore+=*.pdf,*.zip,*.so " binaries
    set wildignore+=*.pyc,*.pyo " Python byte code
    set wildignore+=*.spl " compiled spelling word lists
    set wildignore+=*.swp,*.bak " ignore these
    set wildignore+=*.sw? " Vim swap files
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/bin/*,*/pkg/*

  " }}}

  " Mousing {{{
    if has("mouse")
        set mouse=a " use mouse everywhere
        set nomousehide " don't hide the mouse
        set ttymouse=xterm2 " makes it work in everything
    endif
  " }}}

  " Vim UI {{{
    set t_Co=256
    set background=dark " we plan to use a dark background

    set cursorline " highlight current line
    set lazyredraw " do not redraw while running macros

    set hlsearch
    set incsearch
    set nostartofline " leave my cursor where it was

    set number " turn on line numbers
    set report=0 " tell us when anything is changed via :...

    set shortmess=aOstTI

    set showmode
    set showmatch " show matching brackets

    set sidescrolloff=8
    " set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

    set nowrap " do not wrap line
    set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "           | | | | | | | | |
    "           | | | | | | | | +-- "]" Insert and Replace
    "           | | | | | | | +-- "[" Insert and Replace
    "           | | | | | | +-- "~" Normal
    "           | | | | | +-- <Right> Normal and Visual
    "           | | | | +-- <Left> Normal and Visual
    "           | | | +-- "l" Normal and Visual (not recommended)
    "           | | +-- "h" Normal and Visual (not recommended)
    "           | +-- <Space> Normal and Visual
    "           +-- <BS> Normal and Visual

  " }}}

  " Text Formatting/Layout {{{
    set smartindent " autoindent in vim-sensible

    set completeopt=menuone
    set formatoptions=qrn1j
    set nojoinspaces

    set expandtab " no real tabs please!
    set shiftwidth=4
    set softtabstop=4
    set tabstop=4

    set textwidth=79
    set infercase " case inferred by default
    set ignorecase " case insensitive by default
    set smartcase " if there are caps, go case-sensitive

    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
  " }}}

  " Folding {{{
    set foldenable " Turn on folding
    set foldmarker={{{,}}} " Fold C style code (only use this as default
                    " if you use a high foldlevel)
    set foldmethod=marker " Fold on the marker
    set foldlevel=500 " Don't autofold anything (but I can still
                   " fold manually)
    set foldopen=block,hor,mark,percent,quickfix,tag
  " }}}

  " Mappings {{{
    noremap <C-F> <C-D>
    noremap <C-B> <C-U>

    "call yankstack#setup()

    " Make Y behave like other capitals
    nnoremap Y y$

    nmap <leader>p <Plug>yankstack_substitute_older_paste
    nmap <leader>P <Plug>yankstack_substitute_older_paste

    " Select-all (don't need confusing increment C-a)
    noremap  <C-a> gg0vG$

    " Tag stack
    nnoremap g<Left>  :pop<cr>
    nnoremap g<Right> :tag<cr>

    " Jump list
    nnoremap _ <C-o>
    nnoremap + <C-i>

    " Movement in insert mode
    inoremap <C-h> <C-o>h
    inoremap <C-l> <C-o>a
    inoremap <C-j> <C-o>j
    inoremap <C-k> <C-o>k
    inoremap <C-^> <C-o><C-^>

    nnoremap <Leader>l :ls<CR>:b<space>
    nmap <Leader>m :bn<CR>
    nmap <Leader>M :bp<CR>

    " qq to record, Q to replay
    nnoremap Q @q

    " <tab> / <s-tab> | Circular windows navigation
    nnoremap <tab>   <c-w>w
    nnoremap <S-tab> <c-w>W

    " ROT13 - fun
    map <F12> ggVGg?
    "map <ESC> <ESC><ESC>

    " space / shift-space scroll in normal mode
    noremap <S-space> <C-b>
    noremap <space> <C-f>

    nmap <F5> :bn<CR>
    map <F6> <ESC>:bp<CR>
    nmap <F7> :NERDTreeToggle<CR>
    nmap <F8> :TagbarToggle<CR>

    " Make Arrow Keys Useful Again {{{
        map <down> <ESC>:bn<CR>
        map <left> <ESC>:NERDTreeToggle<CR>
        map <right> <ESC>:TagbarToggle<CR>
        map <up> <ESC>:bp<CR>
    " }}}

  " General Autocommands {{{
    if has("autocmd")
        augroup general
            au!

            " Resize windows automagically
            au VimResized * :wincmd =

            " Always rainbow parens
            au BufRead,BufNewFile * RainbowParentheses

            " Indentation
            au BufRead,BufNewFile *.rb,*.rhtml setlocal sw=2 sts=2
            au BufRead,BufNewFile *.yaml setlocal sw=2 sts=2
            au FileType python,vim,vimrc setlocal ts=4 sts=4 sw=4 expandtab

            " Some JS awesome via romainl
            au BufRead,BufNewFile *.js nnoremap <C-]> :tjump /<c-r>=expand('<cword>')<CR><CR>
            au BufRead,BufNewFile *.js nnoremap <C-}> :ptjump /<c-r>=expand('<cword>')<CR><CR>

            " Override types
            au BufNewFile,BufRead *.md,*.markdown setlocal filetype=markdown " Markdown (common markdown?)
            au BufNewFile,BufRead *.z* setlocal filetype=zsh
            au BufNewFile,BufRead *.scala setlocal filetype=scala

            " Things to spellcheck
            au FileType asciidoc setlocal spell
            au FileType gitcommit setlocal spell
            au FileType markdown setlocal spell
            au FileType svn setlocal spell
        augroup END

        augroup clear_whitespace
            " Automatically delete trailing white spaces
            au!
            au BufEnter,BufRead,BufWrite * silent! %s/[\r \t]\+$//
            au BufEnter *.php :%s/[ \t\r]\+$//e
        augroup END

    endif
  " }}}

