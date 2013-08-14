set nocompatible    "not support VI

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set  diffexpr   WINDOWS 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle begin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set nocompatible " not support VI

filetype off                " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
Bundle 'gmarik/vundle'
" vim-scripts repos
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  美化、扩展
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"主题颜色
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'

" bufexplorer   \BE
Bundle "git://github.com/vim-scripts/bufexplorer.zip.git"
" status line
Bundle 'Lokaltog/vim-powerline'
"fast to get      \w  \f 
Bundle 'Lokaltog/vim-easymotion' 
" Visually display indent levels in Vim   colors
Bundle 'mutewinter/vim-indent-guides'
Bundle 'vim-scripts/calendar.vim--Matsumoto'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   便捷功能
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Bundle 'The-NERD-tree'
Bundle 'scrooloose/nerdtree'
"Syntax check that runs files through external syntax checkers
Bundle 'scrooloose/syntastic'
"comment in a easy way     like c.vim
Bundle 'scrooloose/nerdcommenter' 
" Displays tags in a window, ordered by class etc, i used it instead of taglist
Bundle 'majutsushi/tagbar'
"search c-p
Bundle 'kien/ctrlp.vim'

Bundle 'EasyGrep'
" Deal with pairs of punctuations such as (), [], {}, and so on
Bundle 'kana/vim-smartinput'
" Preview the definition of variables or functions in a preview window
"ctags -R --fields=+lS
" Echo the function declaration in the command line for C/C++
Bundle 'echofunc.vim'
" Ultimate auto completion system for Vim
Bundle 'Shougo/neocomplcache'
"Bundle 'txt.vim'
Bundle 'txt.vim--xu'
" Improved C++ STL syntax highlighting
Bundle 'STL-improved'
"F2 and C-F2
"Bundle 'VisualMarks.vim'
"syntax c++ and qt 
Bundle 'cpp.vim--Skvirsky'
"Bundle 'xolox/vim-easytags'
" tabular /|
Bundle 'godlygeek/tabular'
"Visualize Vim undo tree
"Bundle 'sjl/gundo.vim'
"vic  dic  visual block
"Bundle 'coderifous/textobj-word-column.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"语言编辑支持
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"singlecompile using one key
Bundle 'xuhdev/SingleCompile'
" c++ IDE 
Bundle 'c.vim'
"Python 
"Tab 补全
Bundle 'Pydiction'
" doc lin  syn  check
Bundle 'klen/python-mode'
" Ruby 
"Bundle 'vim-ruby/vim-ruby' 
"html xml ...  cs  repeate
Bundle 'tpope/vim-surround'
"ruby   compile
"Bundle 'tpope/vim-dispatch' 
"git 
"Bundle 'tpope/vim-fugitive' 
"for rails
"Bundle 'tpope/vim-rails' 

" non github repos
" ...
filetype plugin indent on   " required! 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme codeschool
"colorscheme solarized
"
colorscheme molokai
let g:molokai_original=1
let g:rehash256=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" normal settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark              " Set background
set t_Co=256                     " Use 256 colors
set guifont=Consolas:h12:b:cANSI " 字体设置  windows
"set guifont=Courier\ 10\ Pitch\ Bold\ 12 " linux
" MAX    in  windows
au GUIEnter * simalt ~x
"set lines=28 columns=120         " 设置窗口大小
set history=500                  " 保留历史记录
set guioptions-=T                " 取消菜单栏
" Enable syntax highlighting
syntax enable                    " 打开语法高亮
syntax on

set number
" Set to auto read when a file is changed from the outside
set autoread
" 下面两行改变备份文件存放路径
" set backupdir=~/.vim/backup
" set directory=~/.vim/backup
set nobackup                     " 设置不生成备份文件

" allow backspacing over everything in insert mode
set backspace=2                  " 设置退格键可用
" 光标到达行尾或者行首时，特定键继续移动转至下一行或上一行
set wrap                         " 设置自动换行
set linebreak                    " 整词换行，与自动换行搭配使用
set scrolloff=5                  " 在光标接近底端或顶端时，自动下滚或上滚
set showtabline=2                " 设置显是显示标签栏
" Tab related
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab                    " Use spaces instead of tabs
"set list
" set listchars=tab:\|\ , 显示Tab符，使用一高亮竖线代替
set cinoptions=g0,:0,N-s,(0
set autoindent                   " always set autoindenting on
set smartindent
"set mps+=<:>                     " 让<>可以使用%跳转
set hid                          " allow to change buffer without saving
"set shortmess=atI                " shortens messages to avoid 'press a key' prompt
set lazyredraw                   " do not redraw while executing macros (much faster)
" Set Number format to null(default is octal) , when press CTRL-A on number
" like 007, it would not become 010
set nf=

" In Visual Block Mode, cursor can be positioned where there is no actual character
set ve=block
set ignorecase                   " Set search/replace pattern to ignore case
set smartcase                    " 保持字符串的内容，替换字符串的大小写风格. 
set showcmd                      " display incomplete commands
set incsearch                    " do incremental searching
set hlsearch                     " highlight search
set magic                        " Enable magic matching
set showmatch                    " show matching paren
set wildmenu                     " 增强模式中的命令行自动完成操作
set mouse=a                      " Enable mouse usage (all modes) in terminals
set foldmethod=manual           " set default foldmethod
set autochdir                    " 自动切换当前目录为当前文件所在的目录
set tags=tags;                   "ctags

"--------------------------------------------------
" => keymap
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

"Fast remove highlight search
nmap <silent> <leader><cr> :noh<cr>

"--------------------------------------------------
" => ctags
"--------------------------------------------------
" open ctags entries in a new tab
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
"nnoremap <silent> <F3> :Grep<CR>

"--------------------------------------------------
" => txt--xu
"--------------------------------------------------
"高亮显示txt 需要txt.vim
au BufRead,BufNewFile * setfiletype txt
"--------------------------------------------------
" => neocomplcache
"--------------------------------------------------
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
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()

"--------------------------------------------------
" => vim-powerline
"--------------------------------------------------
set laststatus=2            " always have status-line'
"let g:Powerline_symbols = 'fancy'

"--------------------------------------------------
" => NERDTree options   Tagbar options
"--------------------------------------------------
" Auto change the root directory
let NERDTreeChDirMode=2
let NERDTreeWinPos="right"
let g:NERDTreeWinSize = 28
let g:tagbar_width = 28
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

"--------------------------------------------------
" => Python
"--------------------------------------------------
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
let g:pydiction_menu_height = 20

"Python-mode
" Load show documentation plugin
let g:pymode_doc = 1
" Key for show python documentation
let g:pymode_doc_key = 'K'
" Load run code plugin   we have singlecompile
let g:pymode_run = 0
" Key for run python code
"let g:pymode_run_key = '<leader>r'
"Pymode pylint  0 is diable
let g:pymode_lint=1
let g:pymode_lint_checker="pyflakes,mccabe"
"let g:pymode_lint_ignore="E2,W"
"auto-checking on every save is disabled.
let g:pymode_lint_write=0
"enable breakpoint
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key='<leader>b'

"--------------------------------------------------
" => single compile
"--------------------------------------------------
nmap <F5> :SCCompile<cr>
nmap <F7> :SCCompileRun<cr>
"let g:SingleCompile_usequickfix = 0

"--------------------------------------------------
" => Ctrlp
"--------------------------------------------------
"let g:ctrlp_working_path_mode=0
"let g:ctrlp_clear_cache_on_exit=0
"let g:ctrlp_cache_dir=$HOME.'/.vim/.cache/ctrlp'
"let g:ctrlp_extensions=['tag', 'buffertag', 'quickfix', 'dir', 'rtscript']
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

"--------------------------------------------------
" => Indent Guides
"--------------------------------------------------
if !has('gui_running')
    let g:indent_guides_auto_colors=0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=237
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239
endif

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

"--------------------------------------------------   
" =>  tabular                                   
"--------------------------------------------------   
" auto | tabular
"inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
"function! s:align()
  "let p = '^\s*|\s.*\s|\s*$'
  "if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    "let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    "let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    "Tabularize/|/l1
    "normal! 0
    "call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  "endif
"endfunction
"--------------------------------------------------
" =>  easymotion                                   
"--------------------------------------------------
let g:EasyMotion_leader_key = '<Leader>'

"--------------------------------------------------
" =>  syntastic                                    
"--------------------------------------------------
"let g:syntastic_echo_current_error=0
"
"--------------------------------------------------
" =>   ruby                                        
"--------------------------------------------------
"let g:ruby_operators                 = 1
"let g:ruby_fold                      = 1
"let g:ruby_space_errors              = 1

"let g:rubycomplete_buffer_loading    = 1
"let g:rubycomplete_classes_in_global = 1
"let g:rubycomplete_rails             = 1

"--------------------------------------------------
" =>  Debug c c++ java
"--------------------------------------------------
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

"--------------------------------------------------
" =>  END                                 
"--------------------------------------------------
