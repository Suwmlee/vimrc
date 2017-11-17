"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Vimrc
"       Enjoy  :)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => Check Os
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:iswindows = 0
endif

"--------------------------------------------------
" => Encoding
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
" => Appearance
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
    set guifont=Fura_Mono_Medium_for_Powerline:h11:cANSI
else
    set guifont=Aurulent\ Sans\ Mono\ Bold\ 11
endif
syntax enable
syntax on
"--------------------------------------------------
" => Configuration
set nocompatible
" keep history
set history=200
" autoload after modified
set autoread
" unsave file confirm
set confirm
set mouse=a    " mouse enable
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
set wildignore=*.o,*~,*.pyc,*.class,*.swp,*.bak,.svn,.git,.vs
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
"noremap <C-e> <END>
noremap <A-e> <END>
nnoremap ; :
" copy to clipboard
vnoremap <Leader>y "+y
" paste from clipboard
nmap <Leader>p "+gP

" chose the current option when press 'ENTER'
inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<CR>"

" quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" open Note.md
nmap <silent> <leader>en :e $HOME\Note.md<CR>

" Show/Hide Menus & Toolbars
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
" Edit dos M whitespace
command! FixdosM e ++ff=dos<CR>
" Just show one window in Vim
map <silent> <F11> :only<CR>
"--------------------------------------------------
" => Ctags
set tags=tags;/
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
"--------------------------------------------------
" => Load files in a skeleton file
autocmd BufRead,BufNewFile *.xaml :set filetype=xml
autocmd BufRead,BufNewFile *.cshtml :set filetype=html
autocmd BufNewFile,BufRead \*.{md,mdwn,mkd,mkdn,mark\*} set filetype=markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"        Plugins Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:iswindows
    "set rtp+=~/.vim/autoload/plug.vim
    source ~/.vim/autoload/plug.vim
else
    " Install vim-plug if we don't already have it
    if empty(glob("~/.vim/autoload/plug.vim"))
        " Ensure all needed directories exist  (Thanks @kapadiamush)
        execute 'mkdir -p ~/.vim/plugged'
        execute 'mkdir -p ~/.vim/autoload'
        " Download the actual plugin manager
        execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    endif
endif
filetype off
call plug#begin('~/.vim/plugged')
" YCM need compile but highly recommended
Plug 'Valloric/YouCompleteMe'
let g:useYoucompleteme = 1
"Plug 'Shougo/neocomplete.vim'

Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
" visually display indent levels in Vim   colors
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'

" displays tags in a window, ordered by class etc
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
" show tab c-a   d: delete buf
Plug 'vim-ctrlspace/vim-ctrlspace'
" search files  c-p
Plug 'ctrlpvim/ctrlp.vim'
" search words/code
Plug 'rking/ag.vim'
" fast to get      \w  \f
Plug 'easymotion/vim-easymotion'
" show whitespace   delete call :fixwhitespace
Plug 'bronson/vim-trailing-whitespace'
" comment in a easy way  \cc \cu   like c.vim
Plug 'scrooloose/nerdcommenter'
" tabular /|
Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.vim'
" marks ma create a   'a goto a   m- delete
"Plug 'kshenoy/vim-signature'

" deal with pairs of punctuations such as (), [], {}, and so on
Plug 'kana/vim-smartinput'
" syntax check that runs files through external syntax checkers
Plug 'scrooloose/syntastic'

" A solid language pack for Vim ( syntax).
Plug 'sheerun/vim-polyglot'

" xml html complete
Plug 'docunext/closetag.vim'
" html
"Plug 'mattn/emmet-vim'
" html xml ...  cs  repeate
"Plug 'tpope/vim-surround'
" javascript complete
"Plug 'pangloss/vim-javascript'

" Scala support
Plug 'derekwyatt/vim-scala'

" track the engine.
Plug 'SirVer/ultisnips'
" snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" git wrapper for vim
Plug 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on
"--------------------------------------------------
" => YouCompleteMe options
if g:useYoucompleteme
    " youcompleteme defaul tab s-tab have conflict in autocomplete
    let g:ycm_key_list_select_completion = ['<Down>']
    let g:ycm_key_list_previous_completion = ['<Up>']
    let g:ycm_complete_in_comments = 1
    " reminder UltiSnips
    let g:ycm_use_ultisnips_completer = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_collect_identifiers_from_tags_files = 1
    " enable syntactic keywords complete
    let g:ycm_seed_identifiers_with_syntax=1
    "let g:ycm_enable_diagnostic_signs = 0
    "let g:ycm_enable_diagnostic_highlighting = 0
    " language keywords complete
    "let g:ycm_seed_identifiers_with_syntax=1

    let g:ycm_goto_buffer_command = 'horizontal-split'
    " nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
    nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

    " load extra conf.py
    if !empty(glob("~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
        let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
    endif

    " let g:ycm_key_invoke_completion = '<C-Space>'
    let g:ycm_filetype_blacklist = {
        \ 'tagbar' : 1,
        \ 'gitcommit' : 1,
        \}
endif
"--------------------------------------------------
" => NerdTree & Tagbar options
" auto change the root directory
let NERDTreeChDirMode=2
let NERDTreeWinPos="right"
let g:NERDTreeWinSize = 24
let g:tagbar_width = 24
let g:tagbar_left = 1

function! ToggleTagBar()
    let w:jumpbacktohere = 1
    let tagbar_open = bufwinnr('__Tagbar__') != -1
    if tagbar_open
        TagbarClose
    else
        TagbarOpen
    endif
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction

function! ToggleNERDTree()
    let w:jumpbacktohere = 1
    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    if nerdtree_open
        NERDTreeClose
    else
        NERDTree
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

nmap <F7> :call ToggleTagBar()<CR>
nmap <F8> :call ToggleNERDTree()<CR>
"--------------------------------------------------
" => Vim-devicons
let g:NERDTreeRespectWildIgnore=1

let g:NERDTreeDirArrows=0
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:WebDevIconsNerdTreeGitPluginForceVAlign=1
"--------------------------------------------------
" => Syntastic
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1

" error code: http://pep8.readthedocs.org/en/latest/intro.html#error-codes
let g:syntastic_python_checkers=['python','pyflakes', 'pep8']
let g:syntastic_python_pep8_args='--ignore=E501,E225,E124,E712'

" to see error location list
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5

" disabled in java, to be faster
let g:syntastic_mode_map = {'mode': 'active', 'passive_filetypes': ['java'] }
"let g:syntastic_python_python_exec =
"--------------------------------------------------
" => UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" define custom folder under .vim/vimrc/UltiSnips ,
set runtimepath+=~/.vim/vimrc/
let g:UltiSnipsSnippetsDir = '~/.vim/vimrc/UltiSnips'
" edit snippets with the correct filetype
map <leader>us :UltiSnipsEdit<CR>

" if you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"--------------------------------------------------
" => Ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',}

if g:iswindows
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
    let g:ctrlp_user_command = {
      \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
      \ 'fallback': 'dir %s /-n /b /s /a-d'
      \ }
else
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip
    let g:ctrlp_user_command = {
      \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
      \ 'fallback': 'find %s -type f'
      \ }
endif
"--------------------------------------------------
" => Ag
let g:ag_prg="ag --vimgrep -i --ignore bin --ignore obj"
let g:ag_highlight=1
"--------------------------------------------------
" => Ctrlspace
if has("gui_running")
    " Settings for Inconsolata font
    let g:CtrlSpaceSymbols = { "CS": "#", "All": "All", "WLoad": "|*|", "WSave": "[*]","Zoom": "*",}
endif

let g:CtrlSpaceUseTabline = 0
let g:ctrlspace_default_mapping_key = "<C-a>"
" use ctrlp
"nnoremap <silent><C-p> :CtrlSpace O<CR>
map <C-a>  :CtrlSpace<CR>
"--------------------------------------------------
" =>  Easymotion
let g:EasyMotion_leader_key = '<Leader>'
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
"--------------------------------------------------
" => Markdown markdown-preview.vim
let g:vim_markdown_folding_disabled = 1
" path to the chrome or the command to open chrome
let g:mkdp_path_to_chrome = "chrome"
let g:mkdp_auto_start = 0
let g:mkdp_auto_open = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
"--------------------------------------------------
" => Indent Guides
if has('gui_running')
    let g:indent_guides_auto_colors = 1
    set ts=4 sw=4 et
else
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=dark   ctermbg=3
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=dark   ctermbg=3
endif

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size  = 1
"--------------------------------------------------
" => Colorscheme
if has('gui_running')
    set background=dark
    colorscheme solarized
    let g:solarized_termcolors=256
    let g:solarized_italic =  0
else
    set background=dark
    colorscheme molokai
    let g:molokai_original=1
    let g:rehash256=1
endif
"--------------------------------------------------
" END
"--------------------------------------------------

