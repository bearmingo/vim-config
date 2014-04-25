set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

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


"设置leader为,
let mapleader=","
let g:mapleader=","

" 关闭vi兼容模式
set nocompatible

" 自动语法高亮
syntax on
syntax enable

" 检测文件类型
filetype on

" 检测文件类型插件
filetype plugin on

" 不设定在插入状态无涯使用退格键和Delete键删除回车符
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

set smarttab

"设定tab长度为 4
set tabstop=4
"设置按BackSpace的时候可以一次删掉4个空格
set softtabstop=4
"设置 << 和 >> 命令移动时的宽度为 4
set shiftwidth=4
set expandtab
set history=1024

"不突出显示当前行
"set nocursorline
set cursorline

"显示行号
set nu

" 上下可视行数
set scrolloff=6

" 设置本色方案
colorscheme desert

"显示列线
set colorcolumn=80

" 设置窗口行数和列数
set lines=30 columns=100

" 覆盖文件时不备份
set nobackup

" 自动切换当前目录为当前文件所在的目录
set autochdir

" 搜索时忽略大小写，但在在一个或以上大小写字母时仍大小写敏感
set ignorecase
set smartcase
" 搜索文件两端时不重新搜索
set nowrapscan
" 实时搜索
set incsearch
" 搜索时高度显示被找到的文件
set hlsearch
"关闭错误声音
set noerrorbells
set novisualbell
set t_vb=

" 不自动换行
"set nowrap

"How many tenths of a second to blink
set mat=2

" 允许在有未保存的修改时切换缓冲区，此时的修改vim负责保存
set hidden

" 智能自动缩进
set smartindent

" 设定命令行的行数为 1
set cmdheight=1

" 显示状态栏(默认值为 1，无法显示状态栏)
set laststatus=2

" 显示括号配对情况
set showmatch

" 自动换行格式下,如高度在折行之后超过窗口结果这一行看不到的问题
set display=lastline

" 设置在状态行显示的信息
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%

" 显示tab符
"set list
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
"set listchars=trail:.,extends:>,precedes:<

" 启动时不显示捐赠提示
set shortmess=atl

" 自动加载的tags文件
set tags=tags

"blank      空白
"buffers    缓冲区
"curdir     当前目录
"folds      折叠
"help       帮助
"options    选项
"tabpages   选项卡
"winsize    窗口大小
"slash      转换路径中的\为/,以使session文件兼容unix
"unix       设置session文件中的换行模式为unix
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize

"{{{ 开始折叠
set foldenable
" 设置语法折叠
" manual  手工定义折叠
" indent  更多的缩进表示更高级别的折叠
" expr    用表达式来定义折叠
" syntax  用语法高亮来定义折叠
" diff    对没有更改的文本进行折叠
" marker  对文中的标志折叠
set foldmethod=indent
"折叠相关的快捷键
"zR 打开所有的折叠
"za Open/Close (toggle) a folded group of lines.
"zA Open a Closed fold or close and open fold recursively.
"zi 全部 展开/关闭 折叠
"zo 打开 (open) 在光标下的折叠
"zc 关闭 (close) 在光标下的折叠
"zC 循环关闭 (Close) 在光标下的所有折叠
"zM 关闭所有可折叠区域
" 设置折叠区域的宽度
set foldcolumn=0
" 设置折叠层数为
setlocal foldlevel=1
" 新建的文件，刚打开的文件不折叠
autocmd! BufNewFile,BufRead * setlocal nofoldenable
" }}}

" Alt-W切换自动换行
noremap <a-w> :exe &wrap==1 ? 'set nowrap' :　'set wrap'<cr>

" 选中状态下CTRL+c 复制
noremap <C-C> "+y

" Shift + Delete 插入系统剪切板中的内容
noremap <S-Del> "+p
inoremap <S-Del> <esc>"+pa
vnoremap <S-Del> d"+P

"设置代码折叠方式为 手工  indent
"set foldmethod=indent
"设置代码块折叠后显示的行数
set foldexpr=1

if has("gui_running")
"   set guioptions-=m " 隐藏菜单栏
   set guioptions-=T " 隐藏工具栏
"   set guioptions-=L " 隐藏左侧滚动条
"   set guioptions-=r " 隐藏右侧滚动条
"   set guioptions-=b " 隐藏询问滚动条
"   set guioptions=0  " 隐藏tab栏
endif

"编辑vim配置文件
if has("unix")
    set fileformats=unix,dos,mac
    nmap <leader>e :tabnew $HOME/.vimrc<cr>
    let $VIMFILES = $HOME."/.vim"
else
    set fileformats=dos,unix,mac
    nmap <leader>e :tabnew $VIM/_vimrc<CR>
    let $VIMFILES = $VIM."./vim73"
endif

" Atl-Space is System menu
if has("gui")
    noremap <M-Space> :simalt ~<CR>
    inoremap <M-Space> <c-o>:simalt ~<CR>
    cnoremap <M-Space> <c-c>:simalt ~<CR>
endif

"设定doc文档目录
let helptags=$VIMFILES."/doc"
set helplang=cn
"set nobomb
"

" {{{ 编码字体设置
"   if has("multi_byte")
"     set encoding=unicode
"     let &termencoding = &encoding
"     " Set default encoding as UTF-8 with not BOM
"     setglobal fileencoding=utf-8 bomb
"     " Auto detect the file encoding BOM unicode, utf-8, GBK, Big5, Latin1
"     set fileencodings=ucs-bom,utf-8,cp936,cp950,latin1
"
"     " Walkaround the encoding problem for fenc=utf-8 && enc=ucs-2
"     augroup i18n
"         autocmd!
"         autocmd BufReadPost * if &fileencoding == "utf-8" | let &encoding = &fileencoding | endif
"     augroup END
"   endif

set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,cp950,latin1
set ambiwidth=double
"set guifont=YaHei\ Consolas\ Hybrid:h12
"set guifont=Inconsolata\ 11
set guifont=Monaco\ 11
" }}}

" {{{全文搜索选中的文字
vnoremap <silent> <leader>f y/<c-r>=escape(@", "\\/.*$^~[]")<cr><cr>
vnoremap <silent> <leader>F y?<c-r>=escape(@", "\\/.*$^~[]")<cr><cr>
" }}}


"解决menu乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" 删除所有行末尾空格
nnoremap <F10> :%s/[ \t\r]\+$//g<CR>

" 窗口切换
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" Buffers/Tab操作快捷方式
nnoremap <s-h> :bprevious<cr>
nnoremap <s-l> :bnext<cr>
"nnoremap <s-j> :tabnext<cr>
"nnoremap <s-k> :tabprev<cr>

" 模式下上下左右移动光标
inoremap <c-h> <left>
inoremap <c-l> <Right>
inoremap <c-j> <c-o>gj
inoremap <c-k> <c-o>gk

"一些不错的映射转换语法(如果在一个文件中混合不同语言时有用)
nnoremap <leader>1 :set filetype=xhtml<cr>
nnoremap <leader>2 :set filetype=css<cr>
nnoremap <leader>3 :set filetype=javascript<cr>
nnoremap <leader>4 :set filetype=php<cr>
nnoremap <leader>5 :set filetype=c++<cr>

"-----------------------------------------------------------------------------
" NeoBundle Scripts
"
if has('vim_starting')
    set nocompatible            " Be iMproved
    "required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" You can specify revision/branch/tag.
" NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/vimshell'
NeoBundle 'bling/vim-airline'
NeoBundle "MarcWeber/vim-addon-mw-utils"
NeoBundle "tomtom/tlib_vim"
NeoBundle "garbas/vim-snipmate"
NeoBundle "pangloss/vim-javascript"
NeoBundle "scrooloose/nerdtree"
NeoBundle "tpope/vim-git"
NeoBundle "godlygeek/tabular"
NeoBundle "plasticboy/vim-markdown"
NeoBundle "tpope/vim-surround"
NeoBundle "tpope/vim-repeat"
NeoBundle "vim-scripts/matchit.zip"
NeoBundle "vim-scripts/tComment"
NeoBundle "vim-scripts/jQuery"

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------


" PHP Twig 模板引擎语法
"au BufRead,BufNewFile *.twig set syntax=twig

" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab nosmartindent

" 设置字典 ~/.vim/dict/文件的路径
"autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dic
"autocmd filetype css set dictionary=$VIMFILES/dict/css.dic
"autocmd filetype php set dictionary=$VIMFILES/dict/php.dic

autocmd! FileType * exec "set dict+=$VIMFILES/dict/".&ft.".dic"
"set tags+=$VIM/vimfiles/tags/normal/*
"autocmd! FileType * exec "set tags+=$VIM/vimfiles/tags/".&ft."/*"
"inoremap <expr><tab>  pumvisible() ? "\<c-n>" : "\<tab>"
"inoremap <expr><s-tab>  pumvisible() ? "\<c-p>" : "\<tab>"

" {{{ plugin - renamer.vim 文件重命名
" :Renamer 将当前文件所在文件夹下的内容显示在一个新窗口
" :Ren 开始重命名
"}}}


" {{{ plugin - bufexplorer.vim Buffers切换
" \be 全屏方式查看全部打开的文件列表
" \bv 左右方式查看   \bs 上下方式查看
"}}}


" {{{ plugin - bookmarking.vim 设置标记（标签）
" <f9> 设置标记    <f4> 向下跳转标记   <s-f4> 向上跳转标记
map <f9>   :ToggleBookmark<cr>
map <f4>   :NextBookmark<cr>
map <s-f4> :PreviousBookmark<cr>
"}}}


" {{{ plugin - matchit.vim 对%命令进行扩展使得能在嵌套标签和语句之间跳转
" % 正向匹配      g% 反向匹配
" [% 定位块首     ]% 定位块尾
"}}}


" {{{ plugin - mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。
" 这样，当我输入“,hl”时，就会把光标下的单词高亮，在此单词上按“,hh”会清除该
" 单词的高亮。如果在高亮单词外输入“,hh”，会清除所有的高亮。
" 你也可以使用virsual模式选中一段文本，然后按“,hl”，会高亮你所选中的文本；或
" 者你可以用“,hr”来输入一个正则表达式，这会高亮所有符合这个正则表达式的文本。
nmap <silent> <leader>hl <plug>MarkSet
vmap <silent> <leader>hl <plug>MarkSet
nmap <silent> <leader>hh <plug>MarkClear
vmap <silent> <leader>hh <plug>MarkClear
nmap <silent> <leader>hr <plug>MarkRegex
vmap <silent> <leader>hr <plug>MarkRegex
" 你可以在高亮文本上使用“,#”或“,*”来上下搜索高亮文本。在使用了“,#”或
" “,*”后，就可以直接输入“#”或“*”来继续查找该高亮文本，直到你又用“#”
" 或“*”查找了其它文本。
" <silent>* 当前MarkWord的下一个     <silent># 当前MarkWord的上一个
" <silent>/ 所有MarkWords的下一个    <silent>? 所有MarkWords的上一个
"- default highlightings ------------------------------------------------------
highlight def MarkWord1  ctermbg=Cyan     ctermfg=Black  guibg=#8CCBEA    guifg=Black
highlight def MarkWord2  ctermbg=Green    ctermfg=Black  guibg=#A4E57E    guifg=Black
highlight def MarkWord3  ctermbg=Yellow   ctermfg=Black  guibg=#FFDB72    guifg=Black
highlight def MarkWord4  ctermbg=Red      ctermfg=Black  guibg=#FF7272    guifg=Black
highlight def MarkWord5  ctermbg=Magenta  ctermfg=Black  guibg=#FFB3FF    guifg=Black
highlight def MarkWord6  ctermbg=Blue     ctermfg=Black  guibg=#9999FF    guifg=Black
"}}}


" {{{ plugin – winmove.vim 窗口移动
let g:wm_move_left  = "<a-h>"
let g:wm_move_right = "<a-l>"
let g:wm_move_up    = "<a-k>"
let g:wm_move_down  = "<a-j>"
"}}}


" {{{ plugin – ZenCoding.vim 很酷的插件，HTML代码生成
" 插件最新版：http://github.com/mattn/zencoding-vim
" 常用命令可看：http://nootn.com/blog/Tool/23/
let g:user_zen_settings = {
\    'lang': "zh-cn"
\}
" }}}


" {{{ plugin - auto_mkdir.vim 自动创建目录
" }}}


" {{{ plugin - mru.vim 记录最近打开的文件
let MRU_File = $VIMFILES."/_vim_mru_files"
let MRU_Max_Entries = 1000
let MRU_Add_Menu = 0
nmap <leader>f :MRU<cr>
" }}}


" {{{ plugin - taglist.vim 代码导航

if has("unix")
    let Tlist_Ctags_Cmd = '/usr/bin/ctags'
else
    let Tlist_Ctags_Cmd = '"'.$VIMFILES.'/ctags.exe"'
endif

" 不同时显示多个文件的tag 只显示当前文件的
let Tlist_Show_One_File = 1 "no show tag at the same time
" 如果taglist为最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1 "if taglist is last windows, then exit vim
" 在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Highlight_Tag = 1
" 程序启动时不打开taglist窗口
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 0
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_WinWidth = 31
"let tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'
nnoremap <Leader>tl :TlistToggle<CR>
nnoremap <silent> <F7> :Tlist<CR>
"let g:ctags_path=$VIMFILES.'/ctags.exe'
"let g:ctags_statusline=1
"let g:ctags_args=1
" }}}


" {{{ plugin - NERD_commenter.vim 注释代码用的，以下映射已写在插件中
" <leader>ca 在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
" <leader>cc 注释当前行
" <leader>cs 以”性感”的方式注释
" <leader>cA 在当前行尾添加注释符，并进入Insert模式
" <leader>cu 取消注释
" <leader>cm 添加块注释
" }}}


" {{{ plugin - NERD_tree.vim 文件管理器
" 让Tree把自己给装饰得多姿多彩漂亮点
let NERDChristmasTree=1
" 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
let NERDTreeAutoCenter=1
" 指定书签文件
let NERDTreeBookmarksFile=$VIMFILES.'\NERDTree_bookmarks'
" 指定鼠标模式(1.双击打开 2.单目录双文件 3.单击打开)
let NERDTreeMouseMode=2
" 是否默认显示书签列表
let NERDTreeShowBookmarks=0
" 是否默认显示文件
let NERDTreeShowFiles=1
" 是否默认显示隐藏文件
let NERDTreeShowHidden=1
" 是否默认显示行号
let NERDTreeShowLineNumbers=0
" 窗口位置（'left' or 'right'）
let NERDTreeWinPos='left'
" 窗口宽度
let NERDTreeWinSize=31


let NERDTreeIgnore=['\.vim$','\~$','\.pyc$'] "no show specified files
let NERDTreeShowHidden=1    "show hidden file
let NERDTreeSortOrder=['\/$','\.cpp$','\.c$','\.h$', '*']  "order
let NERDTreeCaseSensitiveSort=0 " no case sensitive
let NERDTreeWinSize=30
"let NERDTreeShowLineNumbers=1
"let NERDTreeShowBookmarks=1
"let NERDTreeQuitOnOpen=1
"let NERDTreeHighlightCursorline=1

nnoremap <Leader>tt :NERDTreeToggle<CR>
" 设置F6为打开(关闭)
nnoremap <silent> <F6> :NERDTreeToggle<CR>
"}}}


let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

"----------------------------------------------------------------------
"minibufexpl setting (no used)
"----------------------------------------------------------------------
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplorerMoreThanOne = 1
let g:miniBufExplModSelTarget = 1

"----------------------------------------------------------------------
"" map shorcut
"{{{a.vim
".h 到.cpp文件显示转换
nnoremap <silent> <F12> :A<CR>
"}}}

"{{{grep.vim
" 查找文件内容
nnoremap <silent> <F3> :Grep<CR>
"}}}




"language messages zh_CN.utf-8

set fileencodings=utf-8,gbk,gb2312

set nobackup

behave mswin

"-------------------------------------------------------------------------
"""NERD_tree

"-------------------------------------------------------------------------
"omnicppcomplete setting
"-------------------------------------------------------------------------
set nocp
filetype plugin indent on
"let global scope search
"let OmniCpp_GlobalScopeSearch = 1
"search namespace in the current file and in include files
"let OmniCpp_NamespaceSearch = 2 
"auto display member
"let OmniCpp_DisplayMode = 1
"let OmniCpp_ShowAccess = 1 
"let OmniCpp_ShowPrototypeInAddr = 1 "show function parameters
"let OmniCpp_MayCompleteDot = 1 "autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 "autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 "
"let OmniCpp_SelectFirstItem = 2

map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""neocomplcache 
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
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" {{{ plugin - Session.vim 会话记录
"自动载入会话
"let g:session_autoload = 1
"自动保存会话
"let g:session_autosave = 1
set shellquote=
set shellslash
set shellxquote=
set shellpipe=2>&1\|tee
set shellredir=>%s\ 2>&1
let g:session_directory=$VIMFILES
" }}}



" {{{ Win平台下窗口全屏组件 gvimfullscreen.dll
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
" }}}


" {{{ 颜色显示插件 colorizer.vim
" ,tc 切换高亮
" :ColorHighlight  - start/update highlighting
" :ColorClear      - clear all highlights
" :ColorToggle     - toggle highlights
" }}}

" protobuf .proto
augroup filetype
    au! BufRead,BufNewFile *.proto setfiletype proto
augroup end
