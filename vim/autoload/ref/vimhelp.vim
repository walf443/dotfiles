" A ref source for vimhelp.

let s:save_cpo = &cpo
set cpo&vim

" always available.
function! ref#vimhelp#available()  " {{{2
    return 1
endfunction

function! ref#vimhelp#get_body(query)  " {{{2
    execute ":help " . a:query
endfunction

function! ref#vimhelp#opened(query)  " {{{2
endfunction

function! ref#vimhelp#complete(query)  " {{{2
endfunction

function! ref#vimhelp#get_keyword()  " {{{2
  let kwd = expand('<cword>')
  return kwd
endfunction

function! ref#vimhelp#leave()
  syntax clear
  unlet! b:current_syntax
  unlet! b:ref_vimhelp_mode b:ref_vimhelp_word
endfunction

call ref#detect#register('vim', 'vimhelp')

let &cpo = s:save_cpo
unlet s:save_cpo
