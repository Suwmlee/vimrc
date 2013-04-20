set nocompatible "设置不兼容VI
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
"=========================================

"定义Debug函数，用来调试程序  
func Debug()  
    exec "w"  
      
    if &filetype == 'c'  
    exec "!gcc % -g -o %<.exe"  
    exec "!gdb %<.exe"  
    elseif &filetype == 'cpp'  
    exec "!g++ % -g -o %<.exe"  
    exec "!gdb %<.exe"  
    elseif &filetype == 'java'  
    exec "!javac %"  
    exec "!jdb %<"  
    endif  
endfunc 

" F6 一键Debug
map <F6> :call Debug()<CR>
imap <F6> <ESC>:call Debug()<CR>

"===================设置gbk防止乱码
" Encoding related
set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle begin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               " be iMproved

filetype off                " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" vim-scripts repos

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  美化、扩展
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"hybrid 主题
Bundle 'w0ng/vim-hybrid'
"主题颜色
Bundle 'Color-Sampler-Pack'

"记录增删       就算退出编辑器, 还能还原已经修改过的文件, 方便得复制还原 
"Bundle 'YankRing.vim'

" bufexplorer   \BE
Bundle "git://github.com/vim-scripts/bufexplorer.zip.git"
"丰富的状态栏
Bundle 'Lokaltog/vim-powerline'

" Under linux need exec 'dos2unix ~/.vim/bundle/QFixToggle/plugin/qfixtoggle.vim'
Bundle 'QFixToggle'
" Visually display indent levels in Vim
" 
Bundle 'mutewinter/vim-indent-guides'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   便捷功能
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"显示最近打开过的文件
Bundle 'mru.vim'
"Bundle 'The-NERD-tree'
Bundle 'scrooloose/nerdtree'
" Displays tags in a window, ordered by class etc, i used it instead of taglist
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'

"查找工程文件
Bundle 'grep.vim'
" c 与 h 文件互换
Bundle 'a.vim'
" Deal with pairs of punctuations such as (), [], {}, and so on
Bundle 'kana/vim-smartinput'
" Preview the definition of variables or functions in a preview window
"ctags -R --fields=+lS
" Echo the function declaration in the command line for C/C++
Bundle 'echofunc.vim'

"  Ultimate auto completion system for Vim
Bundle 'Shougo/neocomplcache'

"Bundle 'CmdlineComplete'
Bundle 'xptemplate'

Bundle 'txt.vim'
" Improved C++ STL syntax highlighting
Bundle 'STL-improved'

"F2 and C-F2
"Bundle 'VisualMarks.vim'
"Bundle 'https://github.com/vim-scripts/visualMarks.vim.git'
Bundle 'cpp.vim'

 
"Bundle 'xolox/vim-easytags'

"Syntax check that runs files through external syntax checkers
Bundle 'scrooloose/syntastic'
"格式化编辑
Bundle 'godlygeek/tabular'

"Visualize Vim undo tree
Bundle 'sjl/gundo.vim'

"Text objects based on indent levels
Bundle 'michaeljsmith/vim-indent-object'
"   块操作
Bundle 'coderifous/textobj-word-column.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"语言编辑支持
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"写标签语言的利器             surround.vim
Bundle 'tpope/vim-surround.git'

" c++ IDE 
Bundle 'c.vim'

"Python 插件 
Bundle 'Pydiction'
Bundle  'klen/python-mode'

"一键编译
Bundle 'xuhdev/SingleCompile'

" non github repos
" ...
filetype plugin indent on   " required! 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle end
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"最大化窗口
au GUIEnter * simalt ~x
set history=500     "保留历史记录
set guioptions-=T   " 取消菜单栏
"hi Comment guifg=green


" solarized theme
"set t_Co=256                " Explicitly tell vim that the terminal supports 256 colors, need before setting the colorscheme
"let g:solarized_termcolors=256

"colorscheme desert
set background=dark " Set background
if !has('gui_running')
    set t_Co=256 " Use 256 colors
endif
colorscheme hybrid " Load a colorscheme

"set background=dark
"set font=Consolas
set guifont=Consolas:h11

" Enable syntax highlighting
syntax enable "打开语法高亮
syntax on

set number
set autochdir               " 自动切换当前目录为当前文件所在的目录

" Set to auto read when a file is changed from the outside
set autoread

" 下面两行改变备份文件存放路径
"set backupdir=~/.vim/backup
"set directory=~/.vim/backup
set nobackup "设置不生成备份文件

" vim-powerline
set laststatus=2            " always have status-line'
"let g:Powerline_symbols = 'fancy'
"set statusline=%F%m%r%h%w\ %{&ff}\ %Y\ [ascii:%b\ hex:0x\%02.2B]\ [%{(&fenc\ ==\ \"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %=%l/%L,%v\ %p%%

" allow backspacing over everything in insert mode
set backspace=2 "设置退格键可用

" 光标到达行尾或者行首时，特定键继续移动转至下一行或上一行
set wrap    "设置自动换行
set linebreak "整词换行，与自动换行搭配使用
set scrolloff=5 "在光标接近底端或顶端时，自动下滚或上滚
set showtabline=2 "设置显是显示标签栏

" Tab related
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab               " Use spaces instead of tabs
                        
set list
set listchars=tab:\|\ ,     " 显示Tab符，使用一高亮竖线代替

" Indent related
" http://vimcdoc.sourceforge.net/doc/indent.html
" g0 类的public顶格写
" :0 将 case 标号放在 switch() 缩进位置之后的 N 个字符处
" N-s namespace 下顶格
" (0  条件语句多个条件在不同行时下一行与上一行对齐
set cinoptions=g0,:0,N-s,(0

set autoindent      " always set autoindenting on
set smartindent

set mps+=<:>        " 让<>可以使用%跳转
set hid             " allow to change buffer without saving 
set shortmess=atI   " shortens messages to avoid 'press a key' prompt 
set lazyredraw      " do not redraw while executing macros (much faster)

" Set Number format to null(default is octal) , when press CTRL-A on number
" like 007, it would not become 010
set nf=

" In Visual Block Mode, cursor can be positioned where there is no actual character
set ve=block

set ignorecase  " Set search/replace pattern to ignore case 
set smartcase   " Set smartcase mode on, If there is upper case character in the search patern, the 'ignorecase' option will be override.
set showcmd     " display incomplete commands
set incsearch   " do incremental searching
set hlsearch    " highlight search
set magic       " Enable magic matching
set showmatch   " show matching paren
set wildmenu    " 增强模式中的命令行自动完成操作  
set mouse=a    " Enable mouse usage (all modes) in terminals

" showmarks setting
let showmarks_enable = 0            " disable showmarks when vim startup
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let showmarks_ignore_type = "hqm"   " help, Quickfix, non-modifiable

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

" use Meta key(Windows:Alt) to move cursor in insert mode. 
" Note: if system install "Lingoes Translator", 
"   you will need change/disabled hot key. 
noremap! <M-j> <Down>  
noremap! <M-k> <Up>  
noremap! <M-h> <left>  
noremap! <M-l> <Right>  

"/<C-R><C-W> : 把单个<cword>单词放入搜索或者命令行

" open ctags entries in a new tab
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
nnoremap <silent> <F3> :Grep<CR>

" --lookupfile--
"  script to generate filenametags
"  #!/bin/sh
"  # generate tag file for lookupfile plugin, use absolute path
"  echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
"  find `pwd` -not -regex '.*\.\(png\|gif\)' -type f -printf "%f\t%p\t1\n" | \
"      sort -f >> filenametags 
"      
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找 
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串 
"let g:LookupFile_PreservePatternHistory = 1     "保存查找历史 
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目 
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件 
if filereadable("./filenametags")                "设置tag文件的名字
let g:LookupFile_TagExpr ='"./filenametags"'
endif

set tags=tags;

" -- cscope --
let g:autocscope_menus=0
" Use quickfix window to show cscope results
set cscopequickfix=s-,c-,d-,i-,t-,e-

"'csto' 被设为 0，cscope 数据库先 被搜索，搜索失败的情况下在搜索标签文件 
"设定了 'cscopetag'，这样所有的 :tag 命令就会实际上调用 :cstag。这包括 :tag、Ctrl-] 及 vim -t。
"结果是一般的 tag 命令不仅搜索由 ctags 产生的标签文 件，同时也搜索 cscope 数据库,但是好像有bug,二者共存时有的无法搜索
if has("cscope") 
    set csprg=/usr/bin/cscope
    " Use both cscope and ctag
    set cscopetag
    " Show msg when cscope db added
    set cscopeverbose
    " Use cscope for definition search first
    set cscopetagorder=0
endif

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" 解决cscope与tag共存时ctrl+]有时不正常的bug
nmap <C-]> :tj <C-R>=expand("<cword>")<CR><CR>

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_ignore_case = 0

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" use neocomplcache & clang_complete
" neocomplcache option
"let g:neocomplcache_force_overwrite_completefunc=1
" clang_complete option
"let g:clang_complete_auto=1

"Fast remove highlight search
nmap <silent> <leader><cr> :noh<cr>

" 每行超过80个的字符用下划线标示
au BufRead,BufNewFile *.asm,*.c,*.cpp,*.java,*.cs,*.sh,*.lua,*.pl,*.pm,*.py,*.rb,*.hs,*.vim 2match Underlined /.\%81v/

" 超过80个的字符高亮
"au BufWinEnter * let w:m1=matchadd('Search', '\%<88v.\%>81v', -1)
"au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

"高亮显示txt 需要txt.vim
au BufRead,BufNewFile * setfiletype txt

" Restore the last quit position when open file. 
 autocmd BufReadPost * 
    \ if line("'\"") > 0 && line("'\"") <= line("$") | 
     \     exe "normal g'\"" | 
     \ endif

" 自动更新最后修改时间
function! AutoUpdateTheLastUpdateInfo()
    let s:original_pos = getpos(".")
    let s:regexp = "^\\s*\\([#\\\"\\*]\\|\\/\\/\\)\\s\\?[lL]ast \\([uU]pdate\\|[cC]hange\\):"
    let s:lu = search(s:regexp)
    if s:lu != 0
        let s:update_str = matchstr(getline(s:lu), s:regexp)
        call setline(s:lu, s:update_str . strftime("%Y-%m-%d %H:%M:%S", localtime()))
        call setpos(".", s:original_pos)
    endif
endfunction
"autocmd BufWritePost *.{h,hpp,c,cpp} call AutoUpdateTheLastUpdateInfo()
"autocmd BufNewFile *.{h,hpp,c,cpp} exec 'call append(0, "\/\/ Last Update:" . strftime("%Y-%m-%d %H:%M:%S", localtime()))'

" NERDTree options
" Auto change the root directory
let NERDTreeChDirMode=2
let NERDTreeWinPos="right"
let g:NERDTreeWinSize = 23

" Tagbar options
let g:tagbar_width = 30
let g:tagbar_left = 1

function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1

    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    " Perform the appropriate action
    if nerdtree_open && tagbar_open
        NERDTreeClose
        TagbarClose  
     elseif nerdtree_open
        TagbarOpen
     elseif tagbar_open
        NERDTree
    else  
        NERDTree
        TagbarOpen
    endif

    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction

nmap <F8> :call ToggleNERDTreeAndTagbar()<CR>


"nnoremap <silent> <F9> :A<CR>
"let g:showfuncctagsbin = "C:\Program Files\Vim\ctags57\ctags.exe"

set foldmethod=indent "set default foldmethod


"Python settings 
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
let g:pydiction_menu_height = 20

"Python-mode
" Disable pylint checking every save
let g:pymode_lint_wirte =0

" Load run code plugin
"let g:pymode_run = 1
" Set key for run python code
"let g:pymode_run_key = '<leader>r'

" Load show documentation plugin
let g:pymode_doc = 1

" Key for show python documentation
let g:pymode_doc_key = 'K'

"single compile
nmap <F5> :SCCompile<cr>
nmap <F7> :SCCompileRun<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => Ctrlp
"--------------------------------------------------

let g:ctrlp_working_path_mode=0
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_cache_dir=$HOME.'/.vim/.cache/ctrlp'
let g:ctrlp_extensions=['tag', 'buffertag', 'quickfix', 'dir', 'rtscript']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------
" => Indent Guides
"--------------------------------------------------

"if !has('gui_running')
    let g:indent_guides_auto_colors=0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=237
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239
"endif
"
"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_guide_size=1




