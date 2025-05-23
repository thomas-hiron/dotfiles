autocmd BufNewFile,BufRead compose*.yaml :set filetype=yaml.docker-compose
autocmd BufNewFile,BufRead .gitlab-ci* :set filetype=yaml.gitlab
"
" Add find_usages mapping
autocmd FileType yaml nnoremap <buffer> <leader>fu <cmd>call yaml#FindUsages()<cr>
