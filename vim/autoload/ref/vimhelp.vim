" A ref source for vimhelp.

let s:save_cpo = &cpo
set cpo&vim

let s:source = {'name': 'vimhelp'}  " {{{1

" always available.
function! s:source.available()  " {{{2
    return 1
endfunction

function! s:source.get_body(query)  " {{{2
    execute ":help " . a:query
endfunction

function! s:source.opened(query)  " {{{2
endfunction

function! s:source.complete(query)  " {{{2
endfunction

function! s:source.get_keyword()  " {{{2
  let kwd = expand('<cword>')
  return kwd
endfunction

function! s:source.leave()
  syntax clear
  unlet! b:current_syntax
  unlet! b:ref_vimhelp_mode b:ref_vimhelp_word
endfunction

call ref#register_detection('vim', 'vimhelp')

function! ref#vimhelp#define()  " {{{2
  return s:source
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
