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
Plugin 'jiangmiao/auto-pairs'
Plugin 'pangloss/vim-javascript'
Plugin 'adelarsq/vim-matchit'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
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
nmap <C-h> :w <CR> <C-w>h
nmap <C-l> :w <CR> <C-w>l
nmap <C-j> :w <CR> <C-w>j
nmap <C-k> :w <CR> <C-w>k
map <F8> :w <CR> :!g++ -std=c++11 % -o %< && ./%< <CR>
map <F5> <Esc>:w<CR>:!clear;python %<CR>
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
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_by_filename = 1
" 기본 무시 설정
set wildignore+=*/.git/*,*.so,*.o,*.cc.o,*/out/*,*/pkg/*,*/bin/*,*/node_modules/*
let g:ctrlp_custom_ignore={
\ 'dir': '\v[\/](\.git\|build\|bin\|out)$',
\ 'file': '\v\.(exe|so|dll|o|cc.o)$',
\ }
let g:ctrlp_working_path_mode = 'r'

"""""""""""""""""""""""""""""""
"YCM
"""""""""""""""""""""""""""""""
nnoremap <Leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <Leader>gt :YcmCompleter GoTo<CR>
nnoremap <Leader>gf :YcmCompleter FixIt<CR>
let g:ycm_key_list_select_completion = ['<C-j>']
let g:ycm_key_list_previous_completion=['<C-k>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
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

"""""""""""""""""""""""""""""""
"""* vim-prettier
"""""""""""""""""""""""""""""""
"let g:prettier#autoformat = 1
"#autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

"""""""""""""""""""""""""""""""
""" vim-javascript
"""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1

"""""""""""""""""""""""""""""""
""" vim-jsx
"""""""""""""""""""""""""""""""
let g:vim_jsx_pretty_colorful_config = 1 " default 0

"""""""""""""""""""""""""""""""
""" vim-indent-guideline
"""""""""""""""""""""""""""""""
nmap <leader>glen :IndentGuidesEnable<cr>
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
"""""""""""""""""""""""""""""""
""" nerd tree
"""""""""""""""""""""""""""""""
nmap nerd :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""
""" ultisnips
"""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips']
"let g:UltiSnipsSnippetDirectories = ['UltiSnips']
nmap snip :UltiSnipsEdit<CR>

