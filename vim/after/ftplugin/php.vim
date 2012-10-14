
setlocal expandtab

setlocal dictionary+=~/.vim/dict/php.dict
iabbrev fn, function  () {<CR>}<CR><Up><Up><End><Left><Left><Left><Left><Left><C-R>=Eatchar('\s')<CR>
iabbrev st, $t->subtest("", function ($t) {<CR>});<CR><Up><Up><End><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><C-R>=Eatchar('\s')<CR>
iabbrev ar, array()<Left><C-R>=Eatchar('\s')<CR>
