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
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jeetsukumaran/vim-buffergator'
call vundle#end()            " 필수
filetype plugin indent on    " 필수

syntax on

set modifiable
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nu
"set nowrap
set smartcase
set noswapfile
set incsearch

colorscheme gruvbox
set background=dark

"" 단축키 ""
" PETER """"""""""""""
let mapleader = " "
nnoremap <Leader>fw :w<CR>
nnoremap <Leader>fq :q<CR>
nnoremap <Leader>fq! :q!<CR>
nnoremap <Leader>sv :vsplit<CR>
nnoremap <Leader>sh :split<CR>
"""""""""""""""""""""""
" 이 옵션은 버퍼를 수정한 직후 버퍼를 감춰지도록 한다.
" 이 방법으로 버퍼를 사용하려면 거의 필수다.
set hidden

" 버퍼 새로 열기
" 원래 이 단축키로 바인딩해 두었던 :tabnew를 대체한다.
nmap <leader>T :enew<cr>

" 다음 버퍼로 이동
nmap <leader>l :bnext<CR>

" 이전 버퍼로 이동
nmap <leader>h :bprevious<CR>

" 현재 버퍼를 닫고 이전 버퍼로 이동
" 탭 닫기 단축키를 대체한다.
nmap <leader>bq :bp <BAR> bd #<CR>

" 모든 버퍼와 각 버퍼 상태 출력
nmap <leader>bl :ls<CR>

"""""""""""""""""""""""""""""""
"ctrlp
"""""""""""""""""""""""""""""""
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc']
" 기본 무시 설정
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" 가장 가까운 .git 디렉토리를 cwd(현재 작업 디렉토리)로 사용
" 버전 관리를 사용하는 프로젝트를 할 때 꽤 적절하다.
" .svn, .hg, .bzr도 지원한다.
let g:ctrlp_working_path_mode = 'r'

"""""""""""""""""""""""""""""""
"YCM
"""""""""""""""""""""""""""""""
nnoremap <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <Leader>gf :YcmCompleter FixIt<CR>
"""""""""""""""""""""""""""""""
"Air line
"""""""""""""""""""""""""""""""
" 버퍼 목록 켜기
let g:airline#extensions#tabline#enabled = 1
" 파일명만 출력
let g:airline#extensions#tabline#fnamemod = ':t'
" Theme
let g:airline_theme = 'luna'

"""""""""""""""""""""""""""""""
"buffer gator
"""""""""""""""""""""""""""""""
" 화면 오른쪽을 사용
let g:buffergator_viewport_split_policy = 'R'

" 단축키를 직접 지정하겠음
let g:buffergator_suppress_keymaps = 1

" 이전 버퍼로 이동
nmap <leader>jj :BuffergatorMruCyclePrev<cr>

" 다음 버퍼로 이동
nmap <leader>kk :BuffergatorMruCycleNext<cr>
