autocmd BufNewFile,BufRead *.twig set filetype=twig
autocmd FileType twig setlocal commentstring={#\ %s\ #}
set textwidth=0 " do not automatically wrap text when typing

function! GetTwigIndent()
    let l:line = getline(v:lnum)
    let l:prev_line = getline(v:lnum - 1)
    let l:next_line = getline(v:lnum + 1)

    " Next line is an end|else statement, increment
    if l:next_line =~ '^\s*{%\s*\(end\|else\)'
        return indent(nextnonblank(v:lnum + 1)) + &shiftwidth

    " Next line is an HTML closing tag, increment
    elseif l:next_line =~ '^\s*</'
        return indent(nextnonblank(v:lnum + 1)) + &shiftwidth

    " Prev line is an opening tag, increment
    elseif l:prev_line =~ '^\s*{%\s*\(if\|for\|block\|macro\|embed\|include\|set\)'
        return indent(prevnonblank(v:lnum - 1)) + &shiftwidth

    " Prev line ends with {, increment
    elseif l:prev_line =~ '{\s*$'
        return indent(prevnonblank(v:lnum - 1)) + &shiftwidth

    " Next line starts with }, increment
    elseif l:next_line =~ '^\s*}'
        return indent(nextnonblank(v:lnum + 1)) + &shiftwidth

    " Current line starts with }, decrement
    elseif l:line =~ '^\s*}'
        return indent(prevnonblank(v:lnum)) - &shiftwidth

    " Else, apply nextnonblank indent, works generally better that prevnonblank
    else
        return indent(nextnonblank(v:lnum))
    endif
endfunction

" Enable twig indent function
autocmd FileType twig setlocal indentexpr=GetTwigIndent()

" Add find_usages mapping
autocmd FileType twig nnoremap <buffer> <leader>fu <cmd>call twig#FindUsages()<cr>

" Goes to next view
autocmd FileType twig nmap <Leader>lv <Cmd>call search('include')<CR>t/gf
autocmd FileType twig nmap <Leader>Lv <Cmd>call search('include', 'b')<CR>t/gf
