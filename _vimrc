"0.获取当前OS和Vim的类型

let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

"1.编码设置

"设置gvim内部编码，默认不更改
set encoding=utf-8
"设置当前文件编码，可以更改，如：gbk（同cp936）
set fileencoding=utf-8
"设置支持打开的文件的编码
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
"解决consle输出乱码
if (g:iswindows && g:isGUI)
    language messages zh_CN.utf-8
endif

"2.界面设置

set number				"显示行号
set laststatus=2			"启用状态栏信息
set cmdheight=2				"设置命令行的高度为2，默认为1
set cursorline				"突出显示当前行
set nowrap				"设置不自动换行
set shortmess=atI                       "去掉欢迎界面

"设置 gVim 窗口初始位置及大小
if g:isGUI
    winpos 100 10			"指定窗口出现的位置，坐标原点在屏幕左上角
    set lines=38 columns=120		"指定窗口大小，lines为高度，columns为宽度
endif

"显示/隐藏菜单栏、工具栏、滚动条，可用 Ctrl + F11 切换
if g:isGUI
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    nmap <silent> <c-F11> :if &guioptions =~# 'm' <Bar>
        \set guioptions-=m <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=r <Bar>
        \set guioptions-=L <Bar>
    \else <Bar>
        \set guioptions+=m <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=r <Bar>
        \set guioptions+=L <Bar>
    \endif<CR>
endif

"3.插件配置

"使用Vundle来管理插件
set nocompatible			"禁用 Vi 兼容模式
filetype off				"禁用文件类型侦测
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on

set backspace=indent,eol,start		"开启退格键
syntax enable
colorscheme solarized
if (g:isGUI)
    set background=light
else
    set background=dark
endif
