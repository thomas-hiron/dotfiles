autocmd BufNewFile,BufRead compose*.yaml :set filetype=yaml.docker-compose
autocmd BufNewFile,BufRead .gitlab-ci* :set filetype=yaml.gitlab

" Add find_usages mapping
autocmd FileType yaml nnoremap <buffer> <leader>fu <cmd>call yaml#FindUsages()<cr>
autocmd FileType yaml nnoremap <buffer> <leader>ow <cmd>:OpenWeblate<cr>

" Open Weblate search url for yaml key under the cursor
" Override in project's .nvimrc to update url
function! OpenWeblate()
    execute 'YAMLYankKey'

    " Let cmd finish
    sleep 100m

    " Wait 100 ms to let cmd finish
    let l:yaml_key = getreg('"')

    " Replace all dots with plus signs
    let l:modified_key = substitute(l:yaml_key, '\.', '+', 'g')

    let l:url = 'https://weblate.org/search/project/?q=' . l:modified_key

    execute 'silent !xdg-open "' . l:url . '"'
endfunction

" Register function as command
command! OpenWeblate call OpenWeblate()
