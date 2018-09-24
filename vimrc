" 直接修改
" https://github.com/yangyangwithgnu/use_vim_as_ide/blob/master/README.md
" 大大的配置
" 异步插件参考博客： http://www.skywind.me/blog/archives/2084

" >>>>
" 插件安装

" 安装vim-plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" vim-plug 管理的插件列表必须位于 plug#begin() 和 plug#end() 之间
if has('unix')
    call plug#begin('~/.vim/plugged')
else
    call plug#begin('~/vimfiles/plugged')
endif

"自己添加的插件
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yianwillis/vimcdoc'
Plug 'skywind3000/asyncrun.vim'
Plug 'Yggdroot/indentLine', { 'for':['c', 'cpp', 'python', 'vim'] }
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
if has('unix')
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
else
    Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
endif
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-fugitive'
Plug 'kana/vim-textobj-user', { 'for':['c', 'cpp', 'python', 'vim'] }
Plug 'kana/vim-textobj-indent', { 'for':['c', 'cpp', 'python', 'vim'] }
Plug 'kana/vim-textobj-syntax', { 'for':['c', 'cpp', 'python', 'vim'] }
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'python', 'vim'] }
Plug 'sgur/vim-textobj-parameter', { 'for':['c', 'cpp', 'python', 'vim'] }
Plug 'jsfaint/gen_tags.vim', { 'for':['c', 'cpp', 'python', 'vim'] }
Plug 'junegunn/vim-slash'
Plug 'junegunn/vim-easy-align'
Plug 'w0rp/ale', { 'for':['c', 'cpp', 'python', 'vim'] }
"""""""""""""""""""""

Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-scripts/phd'
Plug 'derekwyatt/vim-fswitch', { 'for':['c', 'cpp', 'python', 'vim'] }
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter', { 'for':['c', 'cpp', 'python', 'vim'] }
Plug 'scrooloose/nerdtree'
Plug 'gcmt/wildfire.vim'
Plug 'Lokaltog/vim-easymotion'
if has('unix')
    Plug 'Valloric/YouCompleteMe'
else
    " 安装教程： https://www.zhihu.com/question/25437050/answer/95662340
    set runtimepath+=d:\tools\YouCompleteMe\YouCompleteMe
    let g:ycm_server_python_interpreter = 'd:\tools\YouCompleteMe\python27_32bit\python.exe'
endif

" 插件列表结束
call plug#end()
" <<<<

" >>
" 杂项

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 定义快捷键的前缀，即 <Leader>
let mapleader="\<space>"
" <<

" >>
" 文件类型侦测

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" <<

" >>
" vim 自身（非插件）快捷键

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p

" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>

" 设置快捷键遍历子窗口
" 依次遍历
nnoremap <Leader>nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j

" 定义快捷键在结对符之间跳转
nmap <Leader>m %
" <<

" >>
" 其他

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
" <<

" <<
" 配色方案

set background=dark
"colorscheme solarized
colorscheme molokai
"colorscheme phd
" <<

" >>
" 营造专注气氛

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
" <<

" >>
" 辅助信息

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set relativenumber
set number
" 高亮显示当前行/列
set cursorline
"set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" <<

" >>
" 其他美化

" 设置 gvim 显示字体
if !has('unix')
    set guifont=Consolas:h12
    "set guifont=Hermit\ NF:h11
    "set guifont=UbuntuMono\ NF:h12
endif
" 禁止折行
"set nowrap
" <<

" >>
" 语法分析

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" <<

" >>
" 缩进

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" <<

" >>
" 代码折叠

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
" <<

" >>
" 接口与实现快速切换

" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>
" <<

" >>
" 基于语义的代码导航
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
" <<

" >>
" YCM 补全

" YCM 补全菜单配色
" 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1

" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0

" 开启 YCM 标签补全引擎
"let g:ycm_collect_identifiers_from_tags_files=0
"" 引入 C++ 标准库 tags
"set tags+=/data/misc/software/app/vim/stdcpp.tags
"set tags+=/data/misc/software/app/vim/sys.tags

" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
"inoremap ;; <C-x><C-o>

" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview

" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1

" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0

" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" <<

" >>
" 工程文件浏览

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置 NERDTree 子窗口宽度
let NERDTreeWinSize=32
" 设置 NERDTree 子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" <<

" >>
" 环境恢复
 
" 设置环境保存项
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"

" 保存 undo 历史。必须先行创建 .undo_history/
set undodir=~/.undo_history/
set undofile

" 保存快捷键
"map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
map <leader>ss :mksession! my.vim<cr>

" 恢复快捷键
"map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>
map <leader>rs :source my.vim<cr>
" <<
 
" >>
" 快速选中结对符内的文本
 
" 快捷键
map <Leader>v <Plug>(wildfire-fuel)
vmap <Leader>v <Plug>(wildfire-water)
" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]
" <<

""""""""""""""""""""""""""""""""自(己)适应的配置""""""""""""""""""""""""""""""""
" YCM 需要
set encoding=utf-8
" win下乱码问题或是在linux下打开win创建的文件
set fileencodings=utf-8,ucs-bom,gbk,big5,cp936,gb18030,gb2312
" 设置一行最多80个字符，命令：gq
set textwidth=80
" this makes the color after the textwidth column highlighted
set colorcolumn=+1
" 在命令模式下(在命令模式有效)将<up> <down> 映射到 <c-p> <c-n>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" cscope的查找快捷键
nmap <C-j>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-j>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-j>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-j>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-j>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-j>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-j>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-j>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-j>a :cs find a <C-R>=expand("<cword>")<CR><CR>

set wildmenu             " vim自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表

" 当新建 .py .h .c .S makefile 等文件时自动调用SetTitle 函数
autocmd BufNewFile *.py,*.[chS],[Mm]akefile,*.mk exec ":call SetTitle()"

" 加入注释
func SetComment(line, comment)
    if (a:line > 0)
        if (a:comment == "#")
            call append(a:line + 0 - 1, a:comment."================================================================")
        else
            call append(a:line + 0 - 1,"/".a:comment."================================================================")
        endif
        call append(a:line + 1 - 1, a:comment."                source for TODO")
        call append(a:line + 2 - 1, a:comment."   ")
        call append(a:line + 3 - 1, a:comment."   filename   : ".expand("%:t"))
        call append(a:line + 4 - 1, a:comment."   author     : chenjiang")
        call append(a:line + 5 - 1, a:comment."   date       : ".strftime("%Y-%m-%d"))
        call append(a:line + 6 - 1, a:comment."   description: TODO")
        call append(a:line + 7 - 1, a:comment."")
        if (a:comment == "#")
            call append(a:line + 8 - 1, a:comment."================================================================")
        else
            call append(a:line + 8 - 1, "================================================================*/")
        endif
        call append(a:line + 9 - 1, "")
        call append(a:line + 10 - 1, "")
    endif
endfunc

" 定义函数SetTitle，自动插入文件头
func SetTitle()
    if &filetype == 'make'
        call append(1 - 1,"") " 魔法数，嘻嘻
        call append(2 - 1,"") " 这是因为append函数是从下一行开始插入
        call SetComment(4, "#") " 空两行
    elseif expand("%:e") == 'py'
        call append(1 - 1,"")
        call append(2 - 1,"")
        call SetComment(4, "#")
    else
        call SetComment(1, "*")
        let l:line = 10 " 定位说明的行数
        if expand("%:e") == 'h'
            call append(l:line + 0, "#ifndef ".toupper(expand("%:t:r"))."_H__")
            call append(l:line + 1, "#define ".toupper(expand("%:t:r"))."_H__")
            call append(l:line + 2, "")
            call append(l:line + 3, "#endif /* ".toupper(expand("%:t:r"))."_H__ */")
        elseif &filetype == 'c'
            call append(l:line + 0, "#include \"".expand("%:t:r").".h\"")
        endif
    endif
endfunc

" <<    插件配置区
 
" {    vim-airline 配置
" 是否打开tabline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
" 设置主题
let g:airline_theme="simple"
" 这个是安装字体后必须设置此项
"let g:airline_powerline_fonts = 1 
" 关闭状态显示空白符号计数"
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
" 状态栏符号设置
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = 'LN '
" }

" {    indentLine
let g:indentLine_enabled=1
nmap <Leader>i :IndentLinesToggle<CR>
" }

" {     asyncrun
" 自动打开 quickfix window，其值为打开的高度
let g:asyncrun_open = 80
 
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
" }

" {     LeaderF 
" 搜索工程下文件 类似ctrlp
let g:Lf_ShortcutF = '<c-p>'
" 打开vim的buffer
"let g:Lf_ShortcutB = '<c-n>'
noremap <Leader>hs :LeaderfMru<cr>
" 列出当前文件的函数
noremap <Leader>ff :LeaderfFunction<cr>
" 打开vim的buffer
noremap <Leader>b :LeaderfBuffer<cr>
" 列出本文件tag
"noremap <Leader>ta :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
 
" 先父目录寻找工程根目录
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
" 工程目录模式 (没理解起！！！)
let g:Lf_WorkingDirectoryMode = 'Ac'
" 打开的分割窗口的高度
let g:Lf_WindowHeight = 0.20
" 文件目录的路径缓存文件夹
let g:Lf_CacheDirectory = expand('~/.cache/LeaderF')
" 自己理解为是否相对工程根目录
let g:Lf_ShowRelativePath = 0
" 不知道，慢慢了解吧！！！
let g:Lf_HideHelp = 1
" 不让光标闪烁
let g:Lf_CursorBlink = 0
" 主题，可以使用airline的主题
let g:Lf_StlColorscheme = 'simple'
 
let g:Lf_NormalMap = {
    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>'],
    \            ["<F6>", ':exec g:Lf_py "fileExplManager.quit()"<CR>'] ],
    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>'],
    \            ["<F6>", ':exec g:Lf_py "bufExplManager.quit()"<CR>'] ],
    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
    \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
    \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
    \ }
" }

" {    gen_tags 来自动加载工程的交叉引用的数据库
" 使用gtags来生成标签
let g:loaded_gentags#gtags = 0
" gtags自动生成标签
let g:gen_tags#gtags_auto_gen = 1
" 忽略某些文件夹
let g:gen_tags#blacklist = ['$HOME']
" }

" {    nerdcommenter c语言注解的风格
"let g:NERDCustomDelimiters = { 'c': { 'left': '/* ','right': ' */' } }
let g:NERDSpaceDelims=1
" }

" {    YouCompleteMe 附加配置
" 触发语义补齐
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python': ['re!\w{2}'],
			\ 'lua': ['re!\w{2}'],
			\ }
" 只有下面后缀的文件才启动分析
let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
			\ "py":1,
			\ "sh":1,
			\ }
" }

" {    vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }

" {    ale
" 自定义某个语言的 lsp
" let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
" 在 normal 启动检测
let g:ale_lint_on_text_changed = 'normal'
" 设置在从 insert 离开启动检测
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
" 定义 lsp 的参数
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_c_clang_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
" }

