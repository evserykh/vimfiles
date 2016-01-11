Plugin 'scrooloose/nerdtree'

let NERDTreeIgnore=['\.swp$']

function! g:WorkaroundNERDTreeToggle()
  try | :NERDTreeToggle | catch | :NERDTree | endtry
endfunction

nmap <silent> <C-n> :call g:WorkaroundNERDTreeToggle()<CR>
