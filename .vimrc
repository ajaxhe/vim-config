set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'vim-scripts/taglist.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'kien/ctrlp.vim'
" YouCompleteMe unavailable: requires Vim 7.4.143+
" also need python future module
Plugin 'Valloric/YouCompleteMe'
" 实时自动补全, 需要vim编译时支持lua
" Plugin 'Shougo/neocomplete.vim'
" 语法纠错功能，配置ycm使用
Plugin 'scrooloose/syntastic'

" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" ycm for python
Plugin 'davidhalter/jedi'
" golang
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" settings

syntax enable
syntax on

set tabstop=4       " 定义tab所等同的空格长度
set expandtab       " 也就是把tabs转换成空格, 适合python，vim-go插件会忽略该配置
set shiftwidth=4
set softtabstop=4
set smarttab

set autoindent
set smartindent
set ruler           " 右下角显示光标位置
set ignorecase      " 搜索时忽略大小写
set hls             " 搜索高亮
set incsearch       " 逐步搜索模式，对当前键入的字符进行搜索而不必等待键入完成
set showcmd         " 右下角显示未完成的命令

set foldmethod=syntax   " vim折叠配置fdm
" Enable folding with the spacebar
nnoremap <space> za

set nobackup
" set nowb
" set noswapfile

" backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" -----------file coding--------
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

" set mapleader
let mapleader=','

" ---------------molokai setting---------------
let g:molokai_original = 1
let g:rehash256 = 1
set t_Co=256
colorscheme molokai

" -----------miniBufExpl---------
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

" --------------NERDTree--------------
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <silent> <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ----------------ctag----------------
map <silent> <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set tags=tags;/
" ----------------taglist settings----------------
" must install ctag before
let Tlist_Use_Right_Window = 1          "让taglist窗口出现在Vim的右边
"当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_One_File = 1             "只显示一个文件中的tag，默认为显示多个
"Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
let Tlist_Sort_Type ='name'
let Tlist_GainFocus_On_ToggleOpen = 1   "Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_Exit_OnlyWindow = 1           "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_WinWidth = 32                 "设置窗体宽度为32，可以根据自己喜好设置
map <silent> <F9> :TlistToggle <CR>

" ------------------ultisnips--------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" 而ultisnips则是用tab做snippet展开，ctrl+b正向切换占位符，ctrl+z反向切换占位符。
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" -------------------ycm-------------------
" 修改ycm的配置，以防<tab>补齐时与ultisnips行为冲突
" 这样让YCM通过回车和向下的箭头来做list
" item正向选择，通过向上箭头做反向选择。通过ctrl+space来原地触发补齐提示。
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['']
let g:ycm_key_invoke_completion = '<C-Space>'

let g:ycm_python_binary_path = '/usr/bin/python'
let g:ycm_autoclose_preview_window_after_completion=1   " 完成操作之后，自动补全窗口不会消失
" nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" --------------------neocomplete--------------------
" Use neocomplete.
" let g:neocomplete#enable_at_startup = 1

" -----------------vim-go-----------------------
"  syntax highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Enable goimports to automatically insert import paths instead of gofmt:
let g:go_fmt_command = "goimports"  " 开启goimports, 保存时，自动填上需要import的库

" vim-go custom mappings
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>i <Plug>(go-install)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>f <Plug>(go-fmt)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>info <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
