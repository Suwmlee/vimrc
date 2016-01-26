"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"        Plugins Config
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Check OS
"--------------------------------------------------
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:iswindows = 0
endif
"--------------------------------------------------
" Custom Settings
let useYoucompleteme = 1
"--------------------------------------------------
" vundle begin
"--------------------------------------------------
" not support VI
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
" Plugins

if useYoucompleteme == 0
    " Ultimate auto completion system for Vim , need lua+
    " just add lua52.dll in VIM folder
    Plugin 'Shougo/neocomplete.vim'
endif
if useYoucompleteme == 1
    " YCM need compile but recommend
    Plugin 'Valloric/YouCompleteMe'
endif

Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
" Visually display indent levels in Vim   colors
Plugin 'nathanaelkane/vim-indent-guides'

" Displays tags in a window, ordered by class etc, i used it instead of taglist
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
" show tab c-a  like \be  d: delete buf
Plugin 'vim-ctrlspace/vim-ctrlspace'
" search files  c-p
Plugin 'ctrlpvim/ctrlp.vim'
" fast to get      \w  \f
Plugin 'easymotion/vim-easymotion'
" show whitespace   delete call :fixwhitespace
Plugin 'bronson/vim-trailing-whitespace'
" comment in a easy way  \cc \cu   like c.vim
Plugin 'scrooloose/nerdcommenter'
" tabular /|
Plugin 'godlygeek/tabular'
" marks ma create a   'a goto a   m- delete
"Plugin 'kshenoy/vim-signature'

" Deal with pairs of punctuations such as (), [], {}, and so on
Plugin 'kana/vim-smartinput'
" syntax highlight and complete
" Syntax check that runs files through external syntax checkers
Plugin 'scrooloose/syntastic'

" Improved C++ syntax highlighting
Plugin 'vim-cpp-enhanced-highlight'

"Python
" Tab complete
Plugin 'rkulla/pydiction'
" Highlight
Plugin 'hdima/python-syntax'
" doc lin  syn  check need compiled with python+
"Plugin 'klen/python-mode'

" HTML highlight
Plugin 'jelera/vim-javascript-syntax'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'nono/jquery.vim'
Plugin 'elzr/vim-json'
" xml html complete
Plugin 'docunext/closetag.vim'
" html xml ...  cs  repeate
Plugin 'tpope/vim-surround'

" singlecompile using one key
Plugin 'xuhdev/SingleCompile'
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
"--------------------------------------------------
" vundle end
"--------------------------------------------------
" => neocomplete
"--------------------------------------------------
if useYoucompleteme == 0

    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Enable heavy features.
    " Use camel case completion.
    "let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    "let g:neocomplcache_enable_underbar_completion = 1

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

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplcache#smart_close_popup() . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplcache_enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplcache_enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplcache_enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplcache_enable_auto_select = 1
    "let g:neocomplcache_disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_force_omni_patterns')
      let g:neocomplcache_force_omni_patterns = {}
    endif
    let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif
"--------------------------------------------------
" => YouCompleteMe options
"--------------------------------------------------
if useYoucompleteme == 1

    " youcompleteme defaul tab s-tab have conflict in autocomplete
    let g:ycm_key_list_select_completion = ['<Down>']
    let g:ycm_key_list_previous_completion = ['<Up>']
    let g:ycm_complete_in_comments = 1
    " 提示UltiSnips
    let g:ycm_use_ultisnips_completer = 1
    " 注释和字符串中的文字也会被收入补全
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_collect_identifiers_from_tags_files = 1
    " 开启语法关键字补全
    let g:ycm_seed_identifiers_with_syntax=1
    " 诊断功能 显示文字高亮和>>提示
    "let g:ycm_enable_diagnostic_signs = 0
    "let g:ycm_enable_diagnostic_highlighting = 0
    " 语言关键字补全, 不过python关键字都很短，所以，需要的自己打开
    "let g:ycm_seed_identifiers_with_syntax=1

    " 跳转到定义处, 分屏打开
    let g:ycm_goto_buffer_command = 'horizontal-split'
    " nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
    nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

    " 引入，可以补全系统，以及python的第三方包
    if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
        let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
    endif

    " 直接触发自动补全 insert模式下
    " let g:ycm_key_invoke_completion = '<C-Space>'
    " 黑名单,不启用
    let g:ycm_filetype_blacklist = {
        \ 'tagbar' : 1,
        \ 'gitcommit' : 1,
        \}
endif
"--------------------------------------------------
" => NERDTree options   Tagbar options
"--------------------------------------------------
" Auto change the root directory
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
"nmap <F7> :call ToggleNERDTreeAndTagbar()<CR>

"--------------------------------------------------
" => Syntastic
"--------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:syntastic_python_python_exec =
"--------------------------------------------------
" => Python
"--------------------------------------------------
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
let g:pydiction_menu_height = 6
"--------------------------------------------------
" => single compile
"--------------------------------------------------
"nmap <F5> :SCCompile<cr>
nmap <F6> :SCCompileRun<cr>
"let g:SingleCompile_usequickfix = 0
"--------------------------------------------------
" => UltiSnips
"--------------------------------------------------
" Trigger configuration. Do not use <tab> if you use YouCompleteMe.
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" 定义存放代码片段的文件夹 .vim/UltiSnips下，使用自定义和默认的，将会的到全局，有冲突的会提示
"let g:UltiSnipsSnippetDirectories  = ['UltiSnips']
"let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
" 进入对应filetype的snippets进行编辑
map <leader>us :UltiSnipsEdit<CR>

" ctrl+j/k 进行选择
func! g:JInYCM()
    if pumvisible()
        return "\<C-n>"
    else
        return "\<c-j>"
    endif
endfunction

func! g:KInYCM()
    if pumvisible()
        return "\<C-p>"
    else
        return "\<c-k>"
    endif
endfunction
inoremap <c-j> <c-r>=g:JInYCM()<cr>
au BufEnter,BufRead * exec "inoremap <silent> " . g:UltiSnipsJumpBackwordTrigger . " <C-R>=g:KInYCM()<cr>"
let g:UltiSnipsJumpBackwordTrigger = "<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"--------------------------------------------------
" => Ctrlp
"--------------------------------------------------
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
" => vim-ctrlspace
"--------------------------------------------------
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
" =>  easymotion
"--------------------------------------------------
let g:EasyMotion_leader_key = '<Leader>'
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
"--------------------------------------------------
" => Indent Guides
"--------------------------------------------------
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
"--------------------------------------------------
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
" => Plugin end
"--------------------------------------------------
