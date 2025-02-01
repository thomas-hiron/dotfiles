function general#RestoreCursorPosition()
    lua require('functions/general').restore_cursor_position()
endfunc

function general#DeleteTrailingSpace()
    lua require('functions/general').delete_trailing_space()
endfunc

function general#GotoTwigView(route)
    " Open controller for route
    execute 'SymfonyGotoRoute' a:route

    " End of method
    normal ]m%

    " Previous render method
    call search('render', 'b')

    " Keep buffer number
    let buffer = bufnr('%')

    " Open view and close previous buffer
    normal t/gf
    execute 'bd ' buffer
endfunc
