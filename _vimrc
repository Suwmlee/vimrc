"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Vimrc
"       Simple Useful  :)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Import Plugin config
"--------------------------------------------------
if filereadable(expand("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
else
    echo "Do not detect '~/.vimrc.plugins' file "
endif
"--------------------------------------------------
" Encoding
"--------------------------------------------------
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8

" use Unix as the standard file type
set ffs=unix,dos,mac
" break at a multi-byte character above 255.
set formatoptions+=m
" don't insert a space between two multi-byte characters.
set formatoptions+=B
"--------------------------------------------------
" Appearance
"--------------------------------------------------
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:iswindows = 0
endif
" avoid the intro message on startup
set shortmess=atI
set t_Co=256
" vim windows contains
set lines=36 columns=130
" set showtabline=2
" set ruler
set title
set number
set cursorline
" always have status-line'
set laststatus=2
" top Toolbar & menu bar
set guioptions-=m
set guioptions-=T

if g:iswindows
    "set guifont=Consolas:h12:b:cANSI
    set guifont=Fura_Mono_Medium_for_Powerline:h11:cANSI
else
    "set guifont=FreeMono\ Bold\ 12
    set guifont=Aurulent\ Sans\ Mono\ 11
endif

syntax enable
syntax on
"--------------------------------------------------
" Configuration
"--------------------------------------------------
set nocompatible
" keep history
set history=500
" autoload after modified
set autoread
" unsave file confirm
set confirm
"set mouse=a    " mouse enable
set mouse-=a   " mouse disabled
set autochdir  " auto change dir
" do not redraw while executing macros (much faster)
set lazyredraw
" in visual block mode, cursor can be positioned where there is no actual character
set virtualedit=block

set nobackup
set noswapfile
"set backup
" backuphistory
"set backupdir=~/.vim/backup
"set directory=~/.vim/backup
"set backupext=.bak

" search
set ignorecase
set smartcase
set incsearch  " search without delay
set hlsearch   " highlight search txt

" remove wrong bell ring
"set belloff = all
set visualbell t_vb=
set novisualbell
set noerrorbells

set smartindent
set autoindent

set foldenable
set foldmethod=indent         " set default foldmethod

" <Tab> related
set shiftwidth=4
set tabstop=4
set softtabstop=4
" use the appropriate number of spaces to insert a <Tab>
set expandtab

" show right command in status-line
set showcmd
" show current mode in status-line
set showmode
" match bracket
set showmatch
" auto scroll when cursor in top or bottom
set scrolloff=4
" use multiple of shiftwidth when indenting with '<' and '>'
set shiftround
" allow to change buffer without saving
set hidden
set ttyfast
set nowrap
" command-line completion operates in an enhanced mode
set wildmenu
"set wildmode=list:longest
" ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class,*.swp,*.bak,.svn,.git
" remember info about open buffers on close"
set viminfo^=%
" for regular expressions turn magic on
set magic

" configure backspace so it acts as it should act
"set backspace=2
set backspace=eol,start,indent

" auto close preview window when leave insert-mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"--------------------------------------------------
" => Shortcut KEY
"--------------------------------------------------
" switching between buffers.
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
inoremap <C-h> <Esc><C-W>h
inoremap <C-j> <Esc><C-W>j
inoremap <C-k> <Esc><C-W>k
inoremap <C-l> <Esc><C-W>l
" set Up and Down non-linewise
noremap <Up> gk
noremap <Down> gj
" fast remove highlight search
nmap <silent> <leader><cr> :noh<cr>
noremap <C-e> <END>
nnoremap ; :
" copy to clipboard
vnoremap <Leader>y "+y
" paste from clipboard
nmap <Leader>p "+gP

" quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" chose the current option when press 'ENTER'
inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<CR>"
"--------------------------------------------------
" =>  Custom KEY
"--------------------------------------------------
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

" Edit dos M whitespace
command! FixdosM e ++ff=dos<CR>

" Full Window
map <silent> <F11> :only<CR>
"--------------------------------------------------
" => Ctags
"--------------------------------------------------
" open ctags entries in a new tab
set tags=tags;/
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
"--------------------------------------------------
" => Load files in a skeleton file
"--------------------------------------------------
autocmd BufRead,BufNewFile *.xaml :set filetype=xml
autocmd BufRead,BufNewFile *.cshtml :set filetype=html
autocmd BufNewFile,BufRead \*.{md,mdwn,mkd,mkdn,mark\*} set filetype=markdown
"--------------------------------------------------
" =>  END
"--------------------------------------------------
