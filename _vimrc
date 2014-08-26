"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用Vundle[https://github.com/gmarik/Vundle.vim]来管理各种Vim插件   "
"""""""""""""""""""""""""""Begin Vundle""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'The-NERD-tree'
Plugin 'https://github.com/vim-ruby/vim-ruby'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""End Vundle""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""VIM Profile"""""""""""""""""""""""""""""""""

" 1.插件设置

" vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized
if !has('gui_running')
    let g:solarized_termtrans=1
    if (&t_Co >= 256 || $TERM == 'xterm-256color')
    else
        let g:solarized_termcolors=16
    endif
endif

" The-NERD-tree
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-o> :NERDTreeToggle<CR>

" Shougo/unite.vim and Shougo/neomru.vim
let g:unite_enable_start_insert=1
noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1

" 2.用户设置

" 自动显示行号
set number
" 修改行号颜色
highlight LineNr ctermfg=darkyellow
" 括号自动补足
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
" 
filetype on

"解决中文乱码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
"解决consle输出乱码
language message zh_CN.utf-8 
" 菜单中文
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

