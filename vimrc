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
    "Plug 'Shougo/denite.nvim'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'gregsexton/gitv'
    Plug 'airblade/vim-gitgutter'

    " tmux
    Plug 'tpope/vim-tbone'
    Plug 'roxma/vim-tmux-clipboard'
    Plug 'bfredl/nvim-ipy'

    " UI
    Plug 'mbbill/undotree',             { 'on': 'UndotreeToggle'   }
    Plug 'scrooloose/nerdtree'
    Plug 'majutsushi/tagbar'

    Plug 'yggdroot/indentline'

    " colorschemes
    Plug 'arcticicestudio/nord-vim'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'lifepillar/vim-solarized8'

    " airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " editing
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'junegunn/vim-easy-align',       { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
    Plug 'junegunn/vim-pseudocl' " prerequisite - pseudo command line
    Plug 'junegunn/vim-oblique' " /-search improvements
    Plug 'junegunn/fzf'
    Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}
    Plug 'brooth/far.vim'
    Plug 'w0rp/ale'

    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary',        { 'on': '<Plug>Commentary' }

    Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
    Plug 'easymotion/vim-easymotion'
    Plug 'unblevable/quick-scope'
    Plug 'rhysd/clever-f.vim'
    Plug 'kien/ctrlp.vim'

    Plug 'jiangmiao/auto-pairs' " auto close

    Plug 'bfredl/nvim-miniyank'
    Plug 'terryma/vim-multiple-cursors'

    Plug 'janko-m/vim-test'

    " lang
    " completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " syntax
    Plug 'herringtondarkholme/yats.vim'
    Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
    Plug 'fatih/vim-go'
    Plug 'arakashic/chromatica.nvim'
    Plug 'pangloss/vim-javascript'
    Plug 'plasticboy/vim-markdown'
    Plug 'derekwyatt/vim-scala'
    Plug 'glench/vim-jinja2-syntax'
    Plug 'vim-perl/vim-perl',        { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }

    " don't forget to call() end, causes troubles -.-
    call plug#end()
  " }}}

  " Plugin settings {{{
    let g:vim_markdown_folding_disabled = 1

    let g:solarized_visibility='normal'
    let g:solarized_diffmode='high'
    let g:solarized_statusline='flat'
    let g:solarized_termtrans=0

    " syntax
    let g:javascript_plugin_jsdoc = 1
    let g:javascript_plugin_ngdoc = 1

    " Airline
    let g:airline_theme = "papercolor"
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
  " }}}

  " Plugin vim-gitgutter {{{
    nmap gnh <Plug>GitGutterNextHunk
    nmap gph <Plug>GitGutterPrevHunk

    let g:gitgutter_max_signs = 1500
  " }}}

  " Plugin Rainbow Parentheses {{{
    "let g:rainbow_active = 1
    let g:rainbow#max_level = 8
    let g:rainbow#pairs = [['(', ')'], ['{', '}'], ['[', ']']]
    "let g:rainbow#colors = { 'dark': ['blue', 'red', 'magenta']}
    " List of colors that you do not want. ANSI code or #RRGGBB
    let g:rainbow#blacklist = ['Cyan', 'Yellow', 10, 11, 233, 234]
  " }}}

  " Start interactive EasyAlign in visual mode
    nmap ga <Plug>(EasyAlign)
    xmap ga <Plug>(EasyAlign)
  " }}}

  " Plugin EasyMotion Minimal config {{{
  " <Leader>f{char} to move to {char}
    map  <Leader>f <Plug>(easymotion-bd-f)
    nmap <Leader>f <Plug>(easymotion-overwin-f)

  " s{char}{char} to move to {char}{char}
    nmap s <Plug>(easymotion-overwin-f2)

  " Move to line
    map <Leader>L <Plug>(easymotion-bd-jk)
    nmap <Leader>L <Plug>(easymotion-overwin-line)

  " Move to word
    map  <Leader>w <Plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)

  " }}}

  " Basics {{{
    set encoding=utf-8
    set nocompatible
    set pastetoggle=<F2>

    set ttyfast
    set cpoptions=aABceFsmq

    set clipboard+=unnamedplus

    set backup
    set undofile
    set undolevels=1000
    set undoreload=10000
    set backupdir=~/.vim/backup
    set directory=~/.vim/tmp
    set undodir=~/.vim/undo

    syntax on
    syntax sync minlines=100
  " }}}

  " General {{{
    let g:grepprg="ack -H --nocolor --nogroup --column"
    let g:skip_loading_mswin = 1

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
        "set ttymouse=xterm2 " makes it work in everything
    endif
  " }}}

  " Vim UI {{{
	"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    "set t_Co=256
    colorscheme solarized8
    "colorscheme nord
    "colorscheme PaperColor
    set background=light
    "set termguicolors " will fuck up the colors

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

    nnoremap U :UndotreeToggle<CR>


    " Make Arrow Keys Useful Again {{{
        map <down> <ESC>:bn<CR>
        map <left> <ESC>:NERDTreeToggle<CR>
        map <right> <ESC>:TagbarToggle<CR>
        map <up> <ESC>:bp<CR>
    " }}}

  " General Autocommands {{{
    function! TrimWhitespace()
        let l:save_cursor = getpos('.')
        %s/\s\+$//e
        call setpos('.', l:save_cursor)
    endfun

    command! TrimWhitespace call TrimWhitespace() " Trim whitespace with command

    if has("autocmd")
        autocmd BufWritePre * :call TrimWhitespace() " Trim whitespace on every save
        autocmd BufWritePre *.html :normal gg=G " reindent html on save
        augroup general
            au!

            " Always rainbow parens
            "au BufRead,BufNewFile * RainbowParentheses

            " Indentation
            au BufRead,BufNewFile *.rb,*.rhtml setlocal sw=2 sts=2
            au BufRead,BufNewFile *.yaml setlocal sw=2 sts=2
            au BufRead,BufNewFile *.js,*.ts setlocal sw=2 sts=2 sw=2 expandtab
            au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
            au FileType vim,vimrc setlocal ts=4 sts=4 sw=4 expandtab

            " Some JS awesome via romainl
            au BufRead,BufNewFile *.js,*.ts nnoremap <C-]> :tjump /<c-r>=expand('<cword>')<CR><CR>
            au BufRead,BufNewFile *.js,*.ts nnoremap <C-}> :ptjump /<c-r>=expand('<cword>')<CR><CR>

            " Override types
            au BufNewFile,BufRead *.z* setlocal filetype=zsh
            au BufNewFile,BufRead *.scala setlocal filetype=scala

            " Things to spellcheck
            au FileType asciidoc setlocal spell
            au FileType gitcommit setlocal spell
            au FileType markdown setlocal spell
        augroup END

    endif
  " }}}

