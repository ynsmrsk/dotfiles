" ____________________________________________________________________________________________________________________ VIM-PLUG
call plug#begin('~/.local/share/nvim/plugged')
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Rigellute/rigel'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
call plug#end()
" ____________________________________________________________________________________________________________________ COLORSCHEME
set t_Co=256
set termguicolors
set background=dark
let ayucolor="dark" " mirage/light
let g:gruvbox_contrast_dark='hard' " soft/light
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
color rigel
" ____________________________________________________________________________________________________________________ EMMET
let g:user_emmet_mode='a' " enable emmet in all modes
let g:user_emmet_expandabbr_key='<c-space>'
" ____________________________________________________________________________________________________________________ NERD-TREE
nnoremap <leader>o :NERDTreeToggle<cr>
" necessary for autocmd's
au StdinReadPre * let s:std_in=1
" open nerdtree automatically when vim starts up if no files were specified
au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" auto quit vim if nerdtree is only buffer
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open nerdtree automatically when vim starts up on opening a directory
au VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" ignore these files
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeHijackNetrw           = 1
let NERDTreeMouseMode             = 2
let NERDTreeKeepTreeInNewTab      = 1
let g:nerdtree_tabs_open_on_gui_startup = 1
let NERDTreeQuitOnOpen            = 0
let NERDTreeChDirMode             = 0
let g:NERDTreeMinimalUI           = 1
let g:NERDTreeWinSize             = 25
let g:NERDTreeDirArrows           = 0
let g:NERDTreeDirArrowExpandable  = ' •'
let g:NERDTreeDirArrowCollapsible = ' ⚬'
let g:NERDTreeStatusline          = " "
let NERDTreeShowHidden            = 1
let NERDTreeMapOpenInTab          = "<ENTER>"
" ____________________________________________________________________________________________________________________ NICE TO HAVE
set cursorline
set noerrorbells " disable error bells
set omnifunc=syntaxcomplete#Complete " css autocomplete.
set nu rnu
set nowrap " do not break lines.
set showmatch " show matching brackets, jump with %
set hidden " Hide buffers in the background instead of closing them.
set mouse=a " enable mouse for clicking, scrolling and resizing
set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
set shortmess+=s " avoid 'search hit BOTTOM'
set updatetime=100
set path+=** " when looking for a file search through every subdirectory
set wildmode=longest,list,full " enable autocompletion.
set smartcase " Automatically switch search to case-sensitive when search query contains an uppercase letter.
set ignorecase " Ignore case when highlighting.
set inccommand=nosplit " shows the effects of a command as you type
set lazyredraw " Don’t update screen during macro and script execution. (for performance)
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

" copy or paste from X11 clipboard
vmap <leader>y :!xclip -f -sel clip<CR>
map <leader>p mz:-1r !xclip -o -sel clip<CR>

" use system clipboard
set clipboard=unnamedplus

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

" open file in browser
nmap <silent> <leader>xo :!xdg-open %<cr>

" toggle highlight search
nnoremap <silent> <leader>/ :set hlsearch!<CR>

" spell-check for english
nnoremap <leader>c :setlocal spell! spelllang=en_us<CR>
" ____________________________________________________________________________________________________________________ WRITE | QUIT
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>W :W<cr>
nmap <leader>Q :q!<cr>
nmap <leader>xx :wq!<cr>
nmap <leader>aw :wa!<cr>
nmap <leader>aq :qa!<cr>

" :W sudo saves the file (useful for handling the permission-denied error)
:command! W w !sudo tee % > /dev/null
" ________________________________________________________________________________________________________________________ TABS
map <silent> <leader>tn :tabnew<cr>
map <silent> <leader>to :tabonly<cr>
map <silent> <leader>tc :tabclose<cr>
map <silent> <leader>tm :tabmove
" look at options for tabmove

let g:lasttab = 1 " Let 'tl' toggle between this and the last accessed tab
nmap <silent> <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <silent> <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" ______________________________________________________________________________________________________________________ BUFFERS
" go to the next/prev buffer in the buffer list
map <silent> <leader>n :bnext<cr>
map <silent> <leader>N :bprevious<cr>

" Close the current buffer
map <silent> <leader>bd :bdelete<cr>:tabclose<cr>gT
" _______________________________________________________________________________________________________________________ WINDOWS
nnoremap <A-s> :new<cr>
nnoremap <A-v> :vnew<cr>

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
au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config " colored i3 config
au BufEnter * if &ft ==# 'help' | wincmd L | endif " open help pages in vertical split
" ___________________________________________________________________________________________________________________ AUTOCOMPLETION
" 'longest' inserts the longest common text of all matches
set completeopt=longest,menuone,preview " 'menuone' does menu will come up even if there's only one match

" Enter key will simply select the highlighted menu item
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" keeps items highlighted. You can keep typing and nearest match will be selected so you can hit Enter any time to insert
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" it simulates <C-X><C-O> to bring up omni completion menu, then simulates <C-N><C-P> to remove the longest common text
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" and simulates <Down> again to keep a match highlighted.
