" Goes to extended class
autocmd FileType php nmap <Leader>le <Cmd>1call search('extends')<CR>W<Cmd>lua vim.lsp.buf.definition()<CR>

" Goes to next view
autocmd FileType php nmap <Leader>lv <Cmd>call search('render')<CR>t/gf
autocmd FileType php nmap <Leader>Lv <Cmd>call search('render', 'b')<CR>t/gf

" Goes to next FormType
autocmd FileType php nmap <Leader>lt <Cmd>call search('Type')<CR>gd
autocmd FileType php nmap <Leader>Lt <Cmd>call search('Type', 'b')<CR>gd

" Goes to overriden method
autocmd FileType php nnoremap <Leader>lo :call GoToOverridenMethod()<CR>

" Goes to first method of line
autocmd FileType php nmap <Leader>ll ^t(gd

" Opens PhpMyAdmin for current Doctrine entity
autocmd FileType php nmap <Leader>sp :call OpenPhpMyAdmin()<CR>

function! GoToOverridenMethod()
    let line = getline('.')
    let pattern = '\v^.+\('
    let match = trim(matchstr(line, pattern))
    normal ,le
    sleep 1000m
    execute '/\V' . match
endfunction

" This is overriden in local .nvimrc to customize DB_NAME
function! OpenPhpMyAdmin()
    " Save current position
    normal mz

    " Find table name
    call search('ORM\\Table(name:')

    let line = getline('.')

    " Extract table name
    let pattern = '\v''.+'''
    let match = matchstr(line, '''\zs\w\+\ze''')

    " Open browser
    execute 'silent !xdg-open "http://phpmyadmin-dev/index.php?route=/sql&pos=0&db=DB_NAME&table=' . match . '"'

    " Restore cursor position
    normal `z
endfunction
