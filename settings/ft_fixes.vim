autocmd BufReadPost,BufNewFile *_spec.rb set syntax=rspec

au BufNewFile,BufRead *.hbs set filetype=html.handlebars syntax=mustache

au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex set filetype=eelixir"

autocmd BufNewFile,BufRead *.slim set filetype=slim
