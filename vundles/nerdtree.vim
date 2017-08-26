Plugin 'scrooloose/nerdtree'

let NERDTreeIgnore=['\.swp$', 'node_modules']

function! g:WorkaroundNERDTreeToggle()
  try | :NERDTreeToggle | catch | :NERDTree | endtry
endfunction

nmap <leader>d :call g:WorkaroundNERDTreeToggle()<CR>
nmap <leader>f :NERDTreeFind<CR>
