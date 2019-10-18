" ____________________________________________________________________________________________________________________ VIM-PLUG
call plug#begin('~/.local/share/nvim/plugged')
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
call plug#end()
" ____________________________________________________________________________________________________________________ COLORSCHEME
set t_Co=256
set termguicolors
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
color srcery
" ____________________________________________________________________________________________________________________ EMMET
let g:user_emmet_mode='a' " enable emmet in all modes
let g:user_emmet_expandabbr_key='<c-space>'
" ____________________________________________________________________________________________________________________ NETRW
let g:netrw_banner=0
let g:netrw_cursor = 0
let g:netrw_winsize=13
let g:netrw_liststyle=3
let g:netrw_localrmdir='rm -r'

" toggle netrw on the left side of the editor
nnoremap <leader>n :Lexplore<CR>
" ____________________________________________________________________________________________________________________ NICE TO HAVE
set number relativenumber
set noruler " do not show the line and column number of the cursor position
set laststatus=0 " disable statusline
let &statusline='%#Normal#' " disable statusline when having more than one horizontal splits
set noerrorbells " disable error bells
set omnifunc=syntaxcomplete#Complete " css autocomplete.
set nowrap " do not break lines.
set showmatch " show matching brackets, jump with %
set hidden " Hide buffers in the background instead of closing them.
set mouse=a " enable mouse for clicking, scrolling and resizing
set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
set shortmess+=s " avoid 'search hit BOTTOM'
set updatetime=100
set path+=** " when looking for a file search through every subdirectory
set path+=.config/**
set wildmode=longest,list,full " enable autocompletion.
set smartcase " Automatically switch search to case-sensitive when search query contains an uppercase letter.
set ignorecase " Ignore case when highlighting.
set inccommand=nosplit " shows the effects of a command as you type
set lazyredraw " Do not update screen during macro and script execution. (for performance)
set scrolloff=0 " The number of screen lines to keep above and below the cursor.
set sidescrolloff=0 " The number of screen columns to keep to the left and right of the cursor.
set viminfo="NONE"
set nobackup
set nowritebackup
set noswapfile
set undofile " Maintain undo history between sessions
" Set end of buffer and vertsplit to empty
set fillchars+=eob:\ ,
set fillchars+=vert:\ ,
" Set list characters
set list listchars=tab:┊\ , "trail:›,extends:#,nbsp:→,space:•¬·
set splitbelow splitright
" ____________________________________________________________________________________________________________________ SHORTCUTS
map <space> <leader>
nnoremap r <c-r>

" use system clipboard
set clipboard+=unnamedplus

" do not break v-mode when indenting
vnoremap > >gv
vnoremap < <gv

" Quick edit vimrc in vertical split
nmap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" repeatable putting with taking help from "registers
nnoremap <c-p> ciw<c-r>0<esc>

" search term in select mode
vnoremap / y/<C-R>"<C-R>

" toggle highlight search
nnoremap <silent> <leader>/ :set hlsearch!<CR>

" spell-check for English
nnoremap <leader>c :setlocal spell! spelllang=en_us<CR>
" ____________________________________________________________________________________________________________________ WRITE | QUIT
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>W :W<cr>
nmap <leader>Q :q!<cr>
nmap <leader>x :wq!<cr>
nmap <leader>aw :wa!<cr>
nmap <leader>aq :qa!<cr>

" :W sudo saves the file (useful for handling the permission-denied error)
:command! W w !sudo tee % > /dev/null
" ________________________________________________________________________________________________________________________ TABS
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <silent> <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" _______________________________________________________________________________________________________________________ WINDOWS
" easier resizing windows
nnoremap <A-+> <C-W>+
nnoremap <A--> <C-W>-
nnoremap <A-<> <C-W><
nnoremap <A->> <C-W>>
nnoremap <A-=> <C-W>=
nnoremap <A-o> <C-W>o

" rotate window
nnoremap <A-r> <C-W>r
" exchange with side window
nnoremap <A-x> <C-W>x
" _______________________________________________________________________________________________________________________ WINDOW NAV
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <A-H> <C-w>H
nnoremap <A-J> <C-w>J
nnoremap <A-K> <C-w>K
nnoremap <A-L> <C-w>L

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l

tnoremap <A-H> <C-\><C-N><C-w>Ha
tnoremap <A-J> <C-\><C-N><C-w>Ja
tnoremap <A-K> <C-\><C-N><C-w>Ka
tnoremap <A-L> <C-\><C-N><C-w>La

inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l

inoremap <A-H> <C-\><C-N><C-w>Ha
inoremap <A-J> <C-\><C-N><C-w>Ja
inoremap <A-K> <C-\><C-N><C-w>Ka
inoremap <A-L> <C-\><C-N><C-w>La
" ______________________________________________________________________________________________________________________ TERMINAL
au TermOpen * startinsert " Start terminal in insert mode
" auto enter insert mode when coming from other windows
au BufWinEnter,WinEnter * if &buftype == 'terminal' | silent! normal i | endif

nnoremap <silent> <A-T> :vnew<CR>:terminal<CR>
nnoremap <silent> <A-t> :10new<CR>:terminal<CR>
tnoremap <Esc> <C-\><C-n>
" ____________________________________________________________________________________________________________________ MOVING LINES
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" ____________________________________________________________________________________________________________________ SOME TRICKS
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " disable auto comment
au BufWritePre * %s/\s\+$//e " auto delete trailing whitespace on save
au BufEnter * if &ft ==# 'help' | wincmd L | endif " open help pages in vertical split
