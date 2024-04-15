autocmd BufNewFile,BufRead *.twig set filetype=twig
autocmd FileType twig setlocal commentstring={#\ %s\ #}
