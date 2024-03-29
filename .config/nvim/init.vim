set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
" set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
" set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set backupdir=~/.cache/vim " Directory to store backup files.
set noswapfile              " disable creating swap file
set completeopt=noinsert,menuone,noselect
set wildmenu
set t_Co=256

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"


" ============================================================================================================================

" Plugins [Vim-Plug: https://github.com/junegunn/vim-plug]
call plug#begin()
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'savq/melange'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'catppuccin/nvim', {'as': 'catppuccin'}
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-fugitive'
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" ============================================================================================================================


" Themes

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let NERDTreeShowHidden=1
let g:airline_theme='molokai'

" Use NeoSolarized
" -----------------
" let g:neosolarized_termtrans=1
" runtime ./colors/NeoSolarized.vim
" colorscheme NeoSolarized

" Use OneHalf
" -----------------
" syntax on
" colorscheme onehalfdark
" let g:airline_theme='onehalfdark'
" " lightline
" " let g:lightline = { 'colorscheme': 'onehalfdark' }
" if exists('+termguicolors')
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
" endif

" Use Melange
" -----------------
" set termguicolors
" colorscheme melange

" Use Catpuccin (https://github.com/catppuccin/nvim)
" ---------------------------------------------------
let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha
lua << EOF
require("catppuccin").setup()
EOF
colorscheme catppuccin

" ============================================================================================================================


" Normal mode remappings
nnoremap qq :q<CR>
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F6> :sp<CR>:terminal<CR>
nnoremap gl :diffget //2<CR>
nnoremap gr :diffget //3<CR>
nnoremap dup :diffupdate<CR>
nnoremap lb :ls<CR>
nnoremap <F9> :n<CR>
nnoremap <F7> :N<CR>

" Show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> L :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor
" autocmd CursorHold * silent call <SID>show_documentation()

" ============================================================================================================================


" Lua treesitter config script
" -----------------------------
lua << EOF
    require'nvim-treesitter.configs'.setup {
        ensure_installed = {
            "html", "css", "scss", "javascript", "typescript", "tsx", "regex",
            "json", "yaml", "toml", "bash"
        },
        sync_install = false,
        
        highlight = {
            -- `false` will disable the whole extension
            enable = true,
            
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
    }
EOF
