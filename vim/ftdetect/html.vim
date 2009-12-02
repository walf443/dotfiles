function! s:FThtml()
    if getline(1).getline(2).getline(3) =~ '\<!DOCTYPE\s\_.\sXHTML\s'
        setf xhtml
    endif
    setf html
endfunction

function! s:FTtt2html()
    let save_cursor = getpos('.')
    call cursor(1, 1)
    if search('->', 'cn' ) > 0
        setf tmt2html
    elseif search('\[%', 'cn') > 0
        setf tt2html
    else
        call s:FThtml()
    endif
    call setpos('.', save_cursor)
endfunction

autocmd! BufReadPost *.html call s:FTtt2html()

