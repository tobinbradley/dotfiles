" Plugins
call plug#begin('~/.config/nvim/plugged')

" Autocomplete
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'

" Theme
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-one'
Plug 'gregsexton/Atom'
Plug 'chriskempson/base16-vim'

" Vim airline
Plug 'itchyny/lightline.vim'

" Git
Plug 'tpope/vim-fugitive'

" Utility
Plug 'tpope/vim-sensible'
Plug 'thirtythreeforty/lessspace.vim'
Plug 'tpope/vim-unimpaired'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'szw/vim-ctrlspace'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'w0rp/ale'

" VueJS
Plug 'posva/vim-vue'

" Emmet
Plug 'mattn/emmet-vim'

Plug 'prettier/vim-prettier', {
        \ 'do': 'yarn install',
        \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'

" Language
Plug 'plasticboy/vim-markdown'
Plug 'othree/html5.vim'
Plug 'leafgarland/typescript-vim'
call plug#end()


" Misc Editor Preferences
set ignorecase
set smartcase
set nospell
set nohlsearch
set nobackup
set noswapfile
set nofixendofline
set hidden
set relativenumber number
set nowrap
set ttimeout
set ttimeoutlen=0
set clipboard+=unnamedplus
set shortmess=I
set nofoldenable
let loaded_matchparen=1
let mapleader=","
let g:terminal_scrollback_buffer_size=100000
set autoread                    "Reload files changed outside vim
set mouse=a                     "Get scroll wheel working


" Language Server
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['/usr/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js']
\ }
let g:LanguageClient_autoStart = 1
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>


" Tabs
set softtabstop=2
set tabstop=2
set shiftwidth=4
set expandtab
filetype plugin indent on


" Shortcuts
tnoremap <esc> <C-\><C-n>
nnoremap <leader>t :term <up><cr>
nnoremap Y y$


" Style
if (has("termguicolors"))
 set termguicolors
endif

colorscheme base16-google-dark
"let g:lightline = { 'colorscheme': 'onehalfdark' }
set background=dark
set bg=dark
hi EndOfBuffer ctermfg=bg
set fillchars=

hi! link CursorLineNr LineNr
hi! VertSplit ctermbg=bg
hi! StatusLine ctermfg=bg ctermbg=bg
hi! StatusLineNC ctermfg=bg ctermbg=bg
hi! FoldColumn ctermbg=None
hi! SignColumn ctermbg=None

set noshowcmd

" No highlighting on quickfix lines
hi! link QuickFixLine Normal

set numberwidth=4
set foldcolumn=1

" Get rid of status line
autocmd BufEnter * set noru
autocmd BufEnter * set laststatus=2
autocmd BufEnter * set noshowmode


" Ctrl Space
let g:CtrlSpaceSearchTiming = 10
nnoremap <silent><C-Space> :CtrlSpace<CR>
nnoremap <silent><Enter> :CtrlSpace<CR>

" settings for markdown
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,md,text call pencil#init({'wrap':'soft', 'textwidth': 72})
         \ | setl spell spl=en_us fdl=4 noru nonu nornu
         \ | set columns=100
         \ | let g:deoplete#disable_auto_complete=1
augroup END

" Ale
let g:ale_enabled = 0
let g:ale_rust_cargo_use_check = 1
let g:ale_sign_column_always = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_open_list = 0


" Echodoc
let g:echodoc#enable_at_startup = 1


" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#auto_complete_start_length = 2
let g:deoplete#max_list = 50
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "<C-x><C-o>"
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>
inoremap <Nul> <C-x><C-o>
set completeopt=menu,longest,noinsert

" Delimitmate
let g:delimitMate_backspace = 2
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
au FileType rust let b:delimitMate_quotes = "\""


" Smart Indent
function! IndentWithI()
    if len(getline('.')) == 0
        return "\"_cc"
    else
        return "i"
    endif
endfunction
nnoremap <expr> i IndentWithI()


" Terminal
tnoremap <C-w> <C-\><C-n><C-w>
" Fix the following from stomping on non-term windows
autocmd BufEnter * stopinsert
" Automatically enter insert-mode for terminal windows
augroup terminal_insert
    autocmd!
    autocmd BufEnter term://* startinsert
    autocmd BufLeave term://* stopinsert
augroup END


" Prettier
" async
"let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql Prettier
" max line lengh that prettier will wrap on
let g:prettier#config#print_width = 80
" number of spaces per indentation level
" let g:prettier#config#tab_width = 4
" use tabs over spaces
let g:prettier#config#use_tabs = 'false'
" print semicolons
let g:prettier#config#semi = 'true'
" single quotes over double quotes
let g:prettier#config#single_quote = 'true'
" print spaces between brackets
let g:prettier#config#bracket_spacing = 'false'
" put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'true'
" none|es5|all
let g:prettier#config#trailing_comma = 'none'
" flow|babylon|typescript|postcss|json|graphql
let g:prettier#config#parser = 'flow'
