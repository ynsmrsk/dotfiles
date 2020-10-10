" || VIM-PLUG
call plug#begin('~/.local/share/nvim/plugged')
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

" || COLORSCHEME
color srcery
set t_Co=256
set termguicolors
hi Normal guibg=#000000
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
" || HIGHLIGHT GROUPS
hi VertSplit guibg=#080808 gui=bold
hi StatusLine   guifg=#60A5A9  guibg=#080808 gui=none
hi StatusLineNC guifg=#648688 guibg=#080808  gui=none
hi Cursorline guibg=#080808
hi CursorlineNR guibg=#000000

" || EMMET
let g:user_emmet_expandabbr_key='<c-space>'

" || NETRW
let g:netrw_banner=0
let g:netrw_liststyle=3
set autochdir
autocmd FileType netrw setl bufhidden=wipe
let g:netrw_list_hide='node_modules,^\package-lock.json,^\.git,^\.next,^\.gitignore,^\README.md,^\yarn.lock'
let g:netrw_keepdir=0

" || MISC
set title
set number relativenumber
set omnifunc=syntaxcomplete#Complete " Css auto complete.
set hidden " Hide buffers in the background instead of closing them.
set mouse=a " Enable mouse for clicking, scrolling and resizing.
set tabstop=2 softtabstop=2 shiftwidth=2
set updatetime=100
set undofile " Make and 'undofile' under 'undodir' and maintain undo history between sessions.

set path+=** " When looking for a file search through every subdirectory.
set path+=.config/** " ensure find, vs, sp etc. does see hidden folders and files.
set wildmode=longest,list,full " Enable other completion modes.
set wildmenu
set wildignore+=**/node_modules/**

set smartcase " Automatically switch search to case-sensitive when search query contains an uppercase letter.
set ignorecase " Ignore case when highlighting.
set inccommand=nosplit " shows the effects of a command as you type.
set lazyredraw " Do not update screen during macro and script execution. (for performance).
set scrolloff=0 " The number of screen lines to keep above and below the cursor.
set sidescrolloff=0 " The number of screen columns to keep to the left and right of the cursor.
set splitbelow splitright
set clipboard+=unnamedplus " Use system clipboard

set shortmess+=s " Avoid 'search hit BOTTOM, continuing at TOP' message.
set confirm " Raise a dialog asking to save changed file instead failing command because of unsaved changes.
au FileType * setlocal formatoptions-=cro " disable auto comment
au BufWritePre * %s/\s\+$//e " delete trailing whitespace on save

" || DISABLE STUFF
set noruler " Do not show the line and column number of the cursor position.
set nobackup nowritebackup noswapfile
set shadafile="NONE" " Do not write shada(.viminfo) files.
set fillchars=eob:\ ,vert:\ , " Set end of buffer and vertsplit to empty
set noerrorbells " Disable error bells.
set nowrap " Do not break lines.
"set laststatus=0 " Disable statusline.
"let &statusline='%#Normal#' " Disable statusline when having more than one horizontal splits.

" || SHORTCUTS
map <space> <leader>
nnoremap r <c-r>

" do not break v-mode when indenting
vnoremap > >gv
vnoremap < <gv

" Automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" toggle highlight search
nnoremap <silent> <leader>n :noh<CR>

" spell-check for English
nnoremap <silent> <leader>c :setlocal spell! spelllang=en_us<CR>

" || WRITE | QUIT
nmap <silent> <leader>w :w!<cr>
nmap <silent> <leader>q :q<cr>

" || BUFFERS
nnoremap gb :ls<CR> :b<space>
nnoremap <silent> <C-j> :bprevious<CR>
nnoremap <silent> <C-k> :bnext<CR>
" don't close current window after deleting a buffer when multiple windows is open
map <silent> <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>

" || WINDOWS
" window resizing
nnoremap <A-+> <C-W>+
nnoremap <A--> <C-W>-
nnoremap <A-<> <C-W><
nnoremap <A->> <C-W>>
nnoremap <A-=> <C-W>=
nnoremap <A-o> <C-W>o

" window navigation
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

" rotate window
nnoremap <A-r> <C-W>r
tnoremap <A-r> <C-\><C-N><C-w>r
" exchange with side window
nnoremap <A-x> <C-W>x
tnoremap <A-x> <C-\><C-N><C-w>x

" || TERMINAL
au TermOpen * startinsert " Start terminal in insert mode

nnoremap <silent> <A-T> :vnew<CR>:terminal<CR>
nnoremap <silent> <A-t> :10new<CR>:terminal<CR>
tnoremap <Esc> <C-\><C-n>
