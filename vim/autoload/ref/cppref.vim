" A ref source for alc.
" Version: 0.2.0
" Author : walf443 <walf443 at gmail.com>
" License: Creative Commons Attribution 2.1 Japan License
"          <http://creativecommons.org/licenses/by/2.1/jp/deed.en>

let s:save_cpo = &cpo
set cpo&vim

if !exists('g:ref_cppref_cmd')
    " let g:ref_cppref_cmd = executable("cppref") ? 'cppref' : ''
    let g:ref_cppref_cmd = 'cppref'
endif

let s:source = {'name': 'cppref'}

function! s:source.available()
    return !empty(g:ref_cppref_cmd)
endfunction

function! s:source.get_body(query)
    let res =  ref#system("cppref " . a:query).stdout
    return s:filter(res)
endfunction

function! s:filter(body)
    " 目次に遭遇したときにjumpできるように置換してやる
    "  ex.) ● std >> deqeue >> push_back
    "   ->  -  std >> deqeue::push_back
    let res = substitute(a:body, "• \\([^\n]*\\) >> ", "- \\1::", "g")
    return res
endfunction

function! s:source.opened(query)
    call s:syntax(a:query)
endfunction

function! s:source.leave()
    syntax clear
endfunction

function! s:source.get_keyword()
    let isk = &l:iskeyword
    setlocal isk& isk+=:
    let kwd = expand('<cword>')
    let &l:iskeyword = isk
    return kwd
endfunction

function! s:syntax(query)
    if exists('b:current_syntax') && b:current_syntax == 'ref-cppref'
        return
    endif

    syntax clear
endfunction

function! ref#cppref#define()
    return s:source
endfunction

call ref#register_detection('cpp', 'cppref')

let &cpo = s:save_cpo
unlet s:save_cpo

