"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use vundle [https://github.com/gmarik/Vundle.vim] to manage plugins "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible		" be iMproved, required
filetype off			" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.vim/bundle/plugins')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'The-NERD-tree'
Plugin 'https://github.com/vim-ruby/vim-ruby'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'

" All of your Plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on	" required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" END vundle                                                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 1.Plugin setting.

" vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized

" The-NERD-tree
autocmd vimenter * NERDTree

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

" 2.User setting.
" 自动显示行号
set number
" 修改行号颜色
highlight LineNr ctermfg=darkyellow

" 自动添加括号等
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
