" Goes to extended class
nmap <Leader>le <Cmd>1call search('extends')<CR>W<Cmd>lua vim.lsp.buf.definition()<CR>

" Goes to next view
nmap <Leader>lv <Cmd>call search('render')<CR>t/gf

" Goes to overriden method
nnoremap <Leader>lo :call GoToOverridenMethod()<CR>

function! GoToOverridenMethod()
    let line = getline('.')
    let pattern = '\v^.+\('
    let match = trim(matchstr(line, pattern))
    normal ,le
    sleep 1000m
    execute '/\V' . match
endfunction
