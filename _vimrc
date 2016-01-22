"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Vimrc
"       Simple Useful  :)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Import Plugin config
"--------------------------------------------------
if filereadable(expand("~/plugin.vim"))
    source ~/plugin.vim
endif
"--------------------------------------------------
" Encoding related
"--------------------------------------------------
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B
"--------------------------------------------------
" Appearance
"--------------------------------------------------
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:iswindows = 0
endif
" display somalia
set shortmess=atI
set t_Co=256
" windows contains
set lines=36 columns=130
" set showtabline=2
set number
set cursorline

if g:iswindows
    set guifont=Consolas:h12:b:cANSI
else
    set guifont=FreeMono\ Bold\ 12
endif

syntax enable
syntax on
"--------------------------------------------------
" Configuration
"--------------------------------------------------
" keep history
set history=500
set nocompatible
" autoload after modified
set autoread
" unsave file confirm
set confirm

set nobackup
set noswapfile
"set backup
" backuphistory
"set backupdir=~/.vim/backup
"set directory=~/.vim/backup
"set backupext=.bak

" 让<>可以使用%跳转
"set mps+=<:>
set lazyredraw    " do not redraw while executing macros (much faster)
" Set Number format to null(default is octal) , when press CTRL-A on number
" like 007, it would not become 010
set nf=

" In Visual Block Mode, cursor can be positioned where there is no actual character
set ve=block

" 智能文内搜素提示
set ignorecase " 搜索时忽略大小写
set smartcase  " 保持字符串的内容，替换字符串的大小写风格.
set incsearch  " 随着键入及时搜索
set hlsearch   " 高亮search命中的文本
"set mouse=a    " 鼠标可用
set mouse-=a    " 鼠标不可用
set autochdir  " 自动切换当前目录为当前文件所在的目录

set title
" 去掉错误提示音
set visualbell
set noerrorbells
set novisualbell
set t_vb=
set noeb
set tm=500

" 自动缩进
set smartindent
set autoindent

set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent         " set default foldmethod

" Tab related
set shiftwidth=4
set tabstop=4
set softtabstop=4
" 使用空格替换Tab
set expandtab

" always have status-line'
set laststatus=2

" set ruler
" 在状态栏显示正确输入命令
set showcmd
" show current mode
set showmode
" 括号配对
set showmatch
" 在光标接近底端或顶端时，自动下滚或上滚
set scrolloff=4
" use multiple of shiftwidth when indenting with '<' and '>'
set shiftround
" allow to change buffer without saving
set hidden
set ttyfast
" 设置不自动换行
set nowrap

autocmd BufRead,BufNewFile *.xaml :set filetype=xml
autocmd BufRead,BufNewFile *.cshtml :set filetype=html

" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

" 增强模式中的命令行自动完成操作
set wildmenu
"set wildmode=list:longest
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class,*.swp,*.bak,.svn,.git
" Remember info about open buffers on close"
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
" 设置退格键可用
"set backspace=2
set backspace=eol,start,indent

"--------------------------------------------------
" => hotkey
"--------------------------------------------------
" Switching between buffers.
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
inoremap <C-h> <Esc><C-W>h
inoremap <C-j> <Esc><C-W>j
inoremap <C-k> <Esc><C-W>k
inoremap <C-l> <Esc><C-W>l
" Set Up and Down non-linewise
noremap <Up> gk
noremap <Down> gj
" Fast remove highlight search
nmap <silent> <leader><cr> :noh<cr>
noremap <C-e> <END>
nnoremap ; :
vnoremap <Leader>y "+y
nmap <Leader>p "+gP
"command! Past "+gP

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
"--------------------------------------------------
" =>  Custom KEY
"--------------------------------------------------
" Top Toolbar & Menu
set guioptions-=m
set guioptions-=T
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
" => ctags
"--------------------------------------------------
" open ctags entries in a new tab
set tags=tags;/
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
"--------------------------------------------------
" =>  END
"--------------------------------------------------
