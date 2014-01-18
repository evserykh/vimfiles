autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
  if line("'\"") > 0 && line("'\"") <= line("$")
    exe "normal! g`\""
    normal! zz
  endif
endfunction"`""'")
