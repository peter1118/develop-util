set nocompatible              " Vi와 호환 불가 설정, 필수
filetype off                  " 필수

" Vundle을 포함시키기 위해 runtime 경로를 설정하고 초기화
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'morhetz/gruvbox'
Plugin 'lyuts/vim-rtags'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()            " 필수
filetype plugin indent on    " 필수

syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nu
"set nowrap
"set smartcase
set noswapfile
set incsearch

colorscheme gruvbox
set background=dark

"" 단축키 ""
let mapleader = " "
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR> "버퍼 탭 이동
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR> "버퍼 탭 이전 이동

"""""""""""""""""""""""""""""""
"ctrlp
"""""""""""""""""""""""""""""""
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc']

"""""""""""""""""""""""""""""""
"YCM
"""""""""""""""""""""""""""""""
nnoremap <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <Leader>gf :YcmCompleter FixIt<CR>
