let vimdir = $HOME.'/.config/nvim'
let vimcache = vimdir.'/.cache'

call plug#begin('/home/thia/.config/nvim/plugins')
" Tim Pope Plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
" General Usability Plugins
Plug 'Lokaltog/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fholgado/minibufexpl.vim'
Plug 'xolox/vim-misc'
" Indentation Plugins
Plug 'ciaranm/detectindent'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'godlygeek/tabular'
" Simple Appearance Plugins
Plug 'flazz/vim-colorschemes'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'Valloric/vim-operator-highlight'
" Development Plugins
Plug 'Valloric/ListToggle'
Plug 'vim-scripts/a.vim'
Plug 'honza/vim-snippets'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'SirVer/ultisnips'
call plug#end()

let &packpath = &runtimepath
colorscheme twilight256

set nocompatible "to use these cool features!
set nomodeline "security
set autochdir "automatically call :cd when going to new file
set number "line numbers
set ruler "guarantee that we get cursor co-ords at the bottom
set confirm "when risking loss, puts up dialog asking to save
set hidden "buffers need not be saved to a file before switching
set exrc " .vimrc in directory overrides any options set here
set secure "makes the above less potentially dangerous?
set colorcolumn=81
set clipboard=unnamedplus "default is system copy-pasta
set backspace=indent,eol,start
set scrolloff=1 "always show at least one line above/below current
set viminfo='0,<0,@0,f0,/0
set history=1000
set noswapfile
set nobackup
set gdefault "by default, replace all instances
set splitbelow
set splitright
syntax on
let mapleader=","
"
"Filetypes
au BufNewFile,BufRead *.gen set filetype=python
"
"Indentation
filetype plugin on "tries to figure out filetype and indent properly
filetype indent on
set autoindent "keeps indentation, even if we don't have filetype recognized
set cindent "C-like indentation
set expandtab
set tabstop=4
set shiftwidth=4
let g:indent_guides_enable_on_vim_startup = 1
"
"Command Completion and Stuff
set showcmd "shows current keystroke buffer in command mode
set wildmenu "supposedly better CL completion
set wildmode=longest:full,full "to match the longest common string possible
set cmdheight=1
set previewheight=25
set cmdwinheight=25
"
"Search/Regex
set ignorecase "all lowercase == matches both lower and upper
set smartcase
set hlsearch "highlight matches on-screen when searching
set incsearch "incremental search: searching works as you type
"
"Text Autocompletion
set completeopt-=preview
"
"Status Line
set statusline=%t\ %m%=%l,%c\ %P
"
"Custom Vanilla Keybindings
"save file
nnoremap <C-s> :w<CR>
"prevent save and quit, Ex nonsense
nnoremap ZZ <NOP>
vnoremap ZZ <NOP>
nnoremap Q <NOP>
"jump and recentre window functions
nnoremap C zz
vnoremap C zz
nnoremap T zt
vnoremap T zt
nnoremap X zb
vnoremap X zb
"Window Manipulation
nnoremap <C-Down>  <C-W>j
nnoremap <C-Up>    <C-W>k
nnoremap <C-Left>  <C-W>h
nnoremap <C-Right> <C-W>l
nnoremap <Leader>v  <C-W>v
nnoremap <Leader>s  <C-W>s
nnoremap <Leader>=  <C-W>=
nnoremap <Leader>c  <C-W>c
nnoremap <Leader>H  <C-W>H
nnoremap <Leader>J  <C-W>J
nnoremap <Leader>K  <C-W>K
nnoremap <Leader>L  <C-W>L
"Tab Manipulation
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>T :tabclose<CR>
"Miscellaneous
nnoremap ; :
vnoremap ; :
nnoremap <Leader>; q:
vnoremap <Leader>; q:
nnoremap <Leader><CR> :noh<CR>
nnoremap g[ :pop<CR>
"
"NumberToggle
let g:UserNumberToggleTrigger = 1
let g:NumberToggleTrigger = "<Leader>n"
"
"Easymotion
let g:easymotion_default_mappings = 0
map <Leader> <Plug>(easymotion-prefix)
map <Plug>(easymotion-prefix)b <Plug>(easymotion-b)
map <Plug>(easymotion-prefix)B <Plug>(easymotion-B)
map <Plug>(easymotion-prefix)w <Plug>(easymotion-w)
map <Plug>(easymotion-prefix)W <Plug>(easymotion-W)
map <Plug>(easymotion-prefix)e <Plug>(easymotion-e)
map <Plug>(easymotion-prefix)E <Plug>(easymotion-E)
map <Plug>(easymotion-prefix)r <Plug>(easymotion-ge)
map <Plug>(easymotion-prefix)R <Plug>(easymotion-gE)
map <Plug>(easymotion-prefix)f <Plug>(easymotion-f)
map <Plug>(easymotion-prefix)g <Plug>(easymotion-F)
"
"MiniBufExplorer
nnoremap <Leader><Leader>b :MBEToggle<CR>
nnoremap <Leader>z :MBEbw<CR>
nnoremap <Leader><Leader>n :enew<CR>
nnoremap <A-Right> :MBEbn<CR>
nnoremap <A-Left> :MBEbp<CR>
"
"Ctrl-P (Fuzzy finder + MRU)
let g:ctrlp_map = ''
let g:ctrlp_cmd = ''
let g:ctrlp_mruf_max = 100
let g:ctrlp_max_history = 0
let g:ctrlp_max_files = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'max:50'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = vimcache.'/ctrlp'
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>o :CtrlPBookmarkDir<CR>
nnoremap <Leader>m :CtrlPMRU<CR>
nnoremap <Leader><Leader>p :CtrlPClearAllCaches<CR>
"
"Surround.vim
let g:surround_42="/* \r */"
"
"Rust.vim
let g:rust_recommended_style = 0
"
"clang-format
let g:clang_format#command = 'clang-format-6.0'
let g:clang_format#auto_format = 0
let g:clang_format#code_style = 'llvm'
let g:clang_format#style_options = {
    \ "Standard": "Cpp11" }
autocmd FileType c,cpp,objc nnoremap <buffer><Leader><Leader>f :ClangFormat<CR>
"
"cargo-fmt
autocmd FileType rs nnoremap <buffer><Leader><Leader>f :!cargo-fmt
"
"ultisnips
let g:UltiSnipsExpandTrigger="<Leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<Leader>n"
let g:UltiSnipsJumpBackwardTrigger="<Leader>b"
"
"ncm
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"
"LanguageClient_neovim
let g:LanguageClient_serverCommands =
\{
\   'rust': ['rustup', 'run', 'nightly', 'rls'],
\}
"neomake
"call neomake#configure#automake('w')
