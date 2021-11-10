  " Notes {{{
     " Originally I copied Robert Melton's vimfiles (https://github.com/robertmeta/vimfiles)
     " Got some also from Junegunn Choi (https://github.com/junegunn)
     " It changed a lot since then
  " }}}

  " Plugin Settings {{{
    " Using Junegunn Choi's junegunn/vim-plug plugin manager
    call plug#begin()
    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'tjdevries/lsp_extensions.nvim'
    Plug 'nvim-lua/completion-nvim'

    " Load same default settings
    "Plug 'Shougo/denite.nvim'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'airblade/vim-gitgutter'

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
    "Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'

    " editing
    "Plug 'junegunn/rainbow_parentheses.vim'
    "Plug 'junegunn/vim-easy-align',       { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
    "Plug 'junegunn/vim-pseudocl' " prerequisite - pseudo command line
    "Plug 'junegunn/vim-oblique' " /-search improvements
    "Plug 'junegunn/fzf'
    "Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}
    "Plug 'brooth/far.vim'
    "Plug 'w0rp/ale'

    "Plug 'tpope/vim-repeat'
    "Plug 'tpope/vim-surround'
    "Plug 'tpope/vim-commentary',        { 'on': '<Plug>Commentary' }

    "Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
    Plug 'easymotion/vim-easymotion'
    "Plug 'unblevable/quick-scope'
    "Plug 'rhysd/clever-f.vim'
    Plug 'kien/ctrlp.vim'

    Plug 'jiangmiao/auto-pairs' " auto close

    Plug 'bfredl/nvim-miniyank'
    Plug 'terryma/vim-multiple-cursors'

    "Plug 'janko-m/vim-test'

    " lang
    " completion
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " syntax
    "Plug 'herringtondarkholme/yats.vim'
    "Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
    "Plug 'fatih/vim-go'
    "Plug 'arakashic/chromatica.nvim'
    "Plug 'pangloss/vim-javascript'
    "Plug 'plasticboy/vim-markdown'
    "Plug 'derekwyatt/vim-scala'
    "Plug 'glench/vim-jinja2-syntax'
    "Plug 'vim-perl/vim-perl',        { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }

    " don't forget to call() end, causes troubles -.-
    call plug#end()
  " }}}

  " Plugin settings {{{
    let g:vim_markdown_folding_disabled = 1

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

  " Plugin Miniyank {{{
    map p <Plug>(miniyank-autoput)
    map P <Plug>(miniyank-autoPut)
    map <leader>n <Plug>(miniyank-cycle)
    map <leader>N <Plug>(miniyank-cycleback)
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

  " Completion with language server {{{
    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    " Trigger completion with <Tab>
    inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ completion#trigger_completion()

    " Set updatetime for CursorHold
    " 300ms of no cursor movement to trigger CursorHold
    set updatetime=300
    set signcolumn=yes
lua <<EOF
local lspconfig = require'lspconfig'

-- function to attach completion
-- when setting up lsp
local on_attach = function(client)
require'completion'.on_attach(client)
end

-- Enable rust_analyzer
lspconfig.rust_analyzer.setup({ cmd = {"rustup", "run", "nightly", "rust-analyzer"}, on_attach=on_attach })
lspconfig.tsserver.setup({ on_attach=on_attach })
lspconfig.vimls.setup({ on_attach=on_attach })
lspconfig.gopls.setup({ on_attach=on_attach })
lspconfig.bashls.setup({ on_attach=on_attach })
lspconfig.yamlls.setup({ on_attach=on_attach })
lspconfig.jsonls.setup({ on_attach=on_attach })
lspconfig.dockerls.setup({ on_attach=on_attach })
lspconfig.ccls.setup({ on_attach=on_attach })
lspconfig.pyls.setup({ on_attach=on_attach })

EOF
    " Show diagnostic popup on cursor hold
    "autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

    " Goto previous/next diagnostic warning/error
    nnoremap <silent> g[ <cmd>PrevDiagnosticCycle<cr>
    nnoremap <silent> g] <cmd>NextDiagnosticCycle<cr>
    " Code navigation shortcuts
    nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
    nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
    nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
    nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
    nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
    " Enable type inlay hints
    "autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * \
    "lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }
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
  " }}}

  " General {{{
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    let g:grepprg="rg --vimgrep --no-heading --smart-case"
    let g:skip_loading_mswin = 1

    set hidden " load files in the background
    set history=9999

    set noerrorbells " don't make noise
    set visualbell t_vb=

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

  " Vim UI {{{
    set termguicolors " will fuck up the colors

    "set background=dark
    "colorscheme nord

    set cursorline " highlight current line
    set lazyredraw " do not redraw while running macros

    set nostartofline " leave my cursor where it was

    set number " turn on line numbers
    set report=0 " tell us when anything is changed via :...

    "set shortmess=aOstTI
    set shortmess+=c

    set showmode
    set showmatch " show matching brackets

    set sidescroll=1
    set sidescrolloff=5
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
    set smartindent

    " Set completeopt to have a better completion experience
    " :help completeopt
    " menuone: popup even when there's only one match
    " noinsert: Do not insert text until a selection is made
    " noselect: Do not select, force user to select one from the menu
    set completeopt=menuone,noinsert,noselect

    set expandtab " no real tabs please!
    set shiftwidth=4
    set softtabstop=4
    set tabstop=4

    set textwidth=120
    set infercase " case inferred by default
    set ignorecase " case insensitive by default
    set smartcase " if there are caps, go case-sensitive

    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
  " }}}

  " Mappings {{{
    noremap <C-F> <C-D>
    noremap <C-B> <C-U>

    " Make Y behave like other capitals
    nnoremap Y y$

    " Select-all (don't need confusing increment C-a)
    noremap  <C-a> gg0vG$
    " Clear highlight
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

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

    nmap <Leader>m :bn<CR>
    nmap <Leader>M :bp<CR>

    nnoremap <Leader>T :lua require'lsp_extensions'.inlay_hints()
    nnoremap <Leader>t :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }
    nnoremap <Leader>g :silent lgrep<Space>
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
        au BufNewFile,BufRead *.c,*.cpp,*.cc,*.h,*.hpp setlocal noet ts=4 sw=4 sts=4
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
  " }}}

