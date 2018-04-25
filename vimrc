" 直接修改
" https://github.com/yangyangwithgnu/use_vim_as_ide/blob/master/README.md
" 大大的配置

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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
"""""""""""""""""""""

Plug 'VundleVim/Vundle.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-scripts/phd'
Plug 'derekwyatt/vim-fswitch'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indexer.tar.gz'
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'gcmt/wildfire.vim'
Plug 'sjl/gundo.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'suan/vim-instant-markdown'
if has('unix')
    Plug 'Valloric/YouCompleteMe'
endif

" 插件列表结束
call plug#end()
" <<<<

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 定义快捷键的前缀，即 <Leader>
let mapleader="\<space>"

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
" 配色方案
set background=dark
"colorscheme solarized
colorscheme molokai
"colorscheme phd

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
if 0 == has('unix')
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
" 标签列表

" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>tt :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
     \ 'ctagstype' : 'c++',
     \ 'kinds'     : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" <<

" >>
" 代码导航
 
" 基于标签的代码导航

" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>

" 基于语义的代码导航
if has('unix')
    nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
    " 只能是 #include 或已打开的文件
    nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
endif

" <<

" >>
" 查找

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>

" <<

" >>
" 内容替换

" 快捷替换
let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_skip_key='<S-k>'

" 精准替换
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

if has('unix')
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
    " 库信息参考
     
    " 启用:Man命令查看各类man信息
    source $VIMRUNTIME/ftplugin/man.vim

    " 定义:Man命令查看各类man信息的快捷键
    nmap <Leader>M :Man 3 <cword><CR>

endif
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
 
" 设置快捷键实现一键编译及运行
"nmap <Leader>m :wa<CR> :cd build/<CR> :!rm -rf main<CR> :!cmake CMakeLists.txt<CR>:make<CR><CR> :cw<CR> :cd ..<CR>
"nmap <Leader>g :wa<CR>:cd build/<CR>:!rm -rf main<CR>:!cmake CMakeLists.txt<CR>:make<CR><CR>:cw<CR>:cd ..<CR>:!build/main<CR>

" >>
" 快速选中结对符内的文本
 
" 快捷键
map <Leader>v <Plug>(wildfire-fuel)
vmap <Leader>v <Plug>(wildfire-water)
" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]

" <<

" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>


""""""""""""""""""""""""""""""""自(己)适应的配置""""""""""""""""""""""""""""""""
" win下乱码问题或是在linux下打开win创建的文件
set encoding=utf-8
set fileencodings=utf-8,gbk,big5,cp936,gb18030,gb2312,utf-16
" 设置一行最多80个字符，命令：gq
set textwidth=80
" this makes the color after the textwidth column highlighted
set colorcolumn=+1
" 在命令模式下(在命令模式有效)将<up> <down> 映射到 <c-p> <c-n>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" 在普通模式下缓冲区切换快捷键映射 
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
" cscope配置
if has("cscope")
    set csprg=cscope
    set csto=1
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("build/cscope.out")
        cs add build/cscope.out
    endif
  set csverb
endif

nmap <C-j>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-j>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-j>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-j>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-j>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-j>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-j>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-j>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-j>a :cs find a <C-R>=expand("<cword>")<CR><CR>


" <<    插件配置区
 
" <<    vim-airline 配置
" 是否打开tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" 设置主题
let g:airline_theme="simple"
" 这个是安装字体后必须设置此项" 
"let g:airline_powerline_fonts = 1 
" 关闭状态显示空白符号计数"
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
" 状态栏符号设置
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = 'LN '

" <<    ctrl-sf key mapping
let g:ctrlsf_mapping = {
        \ "next": "n",
        \ "prev": "N",
        \ "vsplit": "o",
        \ "open": "<CR>",
        \ }

" <<    tagbar key mapping
" 设置显示声明的快捷键
let g:tagbar_map_showproto = "d" 
" 设置切换折叠的快捷键
let g:tagbar_map_togglefold = "za"
" 设置跳转到函数的快捷键
let g:tagbar_map_jump = "o"

" <<    asyncrun 设置quickfix输出编码
let g:asyncrun_encs = "cp936"

" <<    ctrlsf后端程序设置
let g:ctrlsf_ackprg = 'ack'

" <<    ctrlp设置
let g:ctrlp_map = '<c-f>'

" <<    indentLine
let g:indentLine_enabled=1
nmap <Leader>i :IndentLinesToggle<CR>
