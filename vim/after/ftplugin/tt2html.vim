setlocal path+=*/tmpl/
setlocal path+=*/template/

setlocal noexpandtab

let tt2html_match_words="\\<\\%(IF\\|FOR\\|WHILE\\)\\>:\\<ELSE\\>:\\<END\\>"
if exists('b:match_words')
    let b:match_words = b:match_words . "," . tt2html_match_words
else
    let b:match_words = tt2html_match_words
endif
