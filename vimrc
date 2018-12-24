call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'andymass/vim-matchup'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'google/vim-searchindex'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'schickling/vim-bufonly'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-syntastic/syntastic'

Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

call plug#end()

set colorcolumn=120
set shiftwidth=2
set softtabstop=2
set tabstop=2

set expandtab
set hlsearch
set ignorecase
set incsearch
set nowrap
set number
set smartcase
set smartindent
set smarttab

" Tab navigation
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" Clear highlight
nnoremap ./ :noh<CR>

" Puts debugging
nnoremap <leader>wtf Op '=' * 80<esc>
nnoremap <leader>wtg Op '+' * 80<esc>

" Toggle paste/nopaste by F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Russian mappings
set langmap=БЮ;<>
set langmap+=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Strip trailing whitespaces
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Set cursor to previos position after open
function! SetCursorPosition()
  if line("'\"") > 0 && line("'\"") <= line("$")
    exe "normal! g`\""
    normal! zz
  endif
endfunction"`""'")
autocmd BufReadPost * call SetCursorPosition()

" solarized theme
let g:solarized_termcolors=256
syntax enable
set background=light
colorscheme solarized

" lightline
set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ }
\ }

" Toggle NERDTree
let NERDTreeIgnore=['\.swp$', 'node_modules']
function! g:WorkaroundNERDTreeToggle()
  try | :NERDTreeToggle | catch | :NERDTree | endtry
endfunction
nmap <silent> <leader>d :call g:WorkaroundNERDTreeToggle()<CR>
nmap <silent> <leader>f :NERDTreeFind<CR>

" vim-gitgutter
set updatetime=100

" fzf.vim
nnoremap <C-p> :Files<CR>
