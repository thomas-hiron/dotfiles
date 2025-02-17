" Goes to extended class
autocmd FileType php nmap <Leader>le <Cmd>1call search('extends')<CR>W<Cmd>lua vim.lsp.buf.definition()<CR>

" Goes to next view
autocmd FileType php nmap <Leader>lv <Cmd>call search('render')<CR>t/gf

" Goes to overriden method
autocmd FileType php nnoremap <Leader>lo :call GoToOverridenMethod()<CR>

" Goes to first method of line
autocmd FileType php nmap <Leader>ll ^t(gd

function! GoToOverridenMethod()
    let line = getline('.')
    let pattern = '\v^.+\('
    let match = trim(matchstr(line, pattern))
    normal ,le
    sleep 1000m
    execute '/\V' . match
endfunction
