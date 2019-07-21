" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" ==== helpers
Plug 'vim-scripts/L9'

" ==== File tree
Plug 'scrooloose/nerdtree'

" ==== Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" ==== syntax helpers
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'mitsuhiko/vim-jinja'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ap/vim-css-color'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'nvie/vim-flake8'
Plug 'bitc/vim-bad-whitespace'

" ==== fold method
Plug 'tmhedberg/SimpylFold'

" ==== Auto-Indentation
Plug 'vim-scripts/indentpython.vim'

" ==== moving / searching
Plug 'easymotion/vim-easymotion'
Plug 'kien/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'

" ==== snippets
Plug 'SirVer/ultisnips'

" ==== IDE plugins
Plug 'benmills/vimux'

" ====  Status bar on bottom
Plug 'bling/vim-airline'

" ==== Display keys
Plug 'liuchengxu/vim-which-key'

" ==== PLUGIN THEMES
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()
filetype plugin indent on

" ==== Colors and other basic settings
colorscheme gruvbox
set guifont=Monospace\ 10
set fillchars+=vert:\$
syntax enable
set background=dark
set ruler
set hidden
set number
set relativenumber
set laststatus=2
set autoindent
set smartindent
set st=4 sw=4 et
set shiftwidth=4
set tabstop=4
let &colorcolumn="80"
set wrap
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set lines=999 columns=999

au BufNewFile,BufRead *.py
			\ set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
			\ set tabstop=2 softtabstop=2 shiftwidth=2

set encoding=utf-8

let python_highlight_all=1
syntax on

" ==== Escape timeout setting
set timeout
set timeoutlen=50
set ttimeoutlen=50

" ==== Vim-Which-Key
let mapleader = "\<Space>"
let maplocalleader = ","
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '<Space>'<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual  ','<CR>

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" ==== NERDTREE
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']

let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
noremap <C-t> :NERDTreeToggle<CR>

" ==== Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"
let g:syntastic_python_checkers = [ 'pylint', 'flake8', 'pep8', 'pyflakes', 'python']
let g:syntastic_yaml_checkers = ['jsyaml']
let g:syntastic_html_tidy_exec = 'tidy5'

" ==== flake8
let g:flake8_show_in_file=1

" ==== vim-python-pep8-indent
let g:python_pep8_indent_multiline_string=-2

" ==== snippets
let g:UltiSnipsExpandTrigger="<A-ENTER>"
let g:UltiSnipsJumpForwardTrigger="<A-ENTER>"
let g:UltiSnipsJumpBackwardTrigger="<A-BACKSPACE>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ==== Easymotion
let g:EasyMotion_do_mapping = 1
let g:EasyMotion_smartcase = 1

" ==== disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" ==== disable mouse
set mouse=c

" ==== disable swap file warning
set shortmess+=A

" ==== custom commands
"command JsonPretty execute ":%!python -m json.tool"
set secure

" ==== More natural split opening
set splitbelow
set splitright

" ==== easier generate new split
nnoremap <silent> <leader>sv <C-w>v
nnoremap <silent> <leader>sh <C-w>s

" ==== Vimux configuration
" Run the current file with rspec
au FileType ruby noremap <Leader>vt :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>

" Run the current file with Python3
au FileType python noremap <Leader>vt :call VimuxRunCommand("clear; python3 " . bufname("%"))<CR>

" Run the current file with gcc
au FileType c, cpp noremap <Leader>vt :call VimuxRunCommand("clear; gcc " . bufname("%"))<CR>

" Run the current file with javac
au FileType java noremap <Leader>vt :call VimuxRunCommand("clear; javac ". bufname("%"))<CR>

" Prompt for a command to run
noremap <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
noremap <Leader>vl :VimuxRunLastCommand<CR>

" Close vim tmux runner opened by VimuxRunCommand
noremap <Leader>vq :VimuxCloseRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
noremap <Leader>vz :call VimuxZoomRunner()<CR>

" Send "C-c" key to the runner pane
nnoremap <Leader>vk :call VimuxSendKeys("C-c")<CR>
vnoremap <Leader>vk :call VimuxSendKeys("C-c")<CR>

" If text is seclected, save it in the v buffer and send that buffer it to
" tmux
vnoremap <Leader>vs "vy:call VimuxSendText(@v)<CR>

" Select current paragraph and send it to tmux
nnoremap <Leader>vs vip"vy:call VimuxSendText(@v)<CR>
