" confに判定されちゃうので強制的に適用する
autocmd! BufRead,BufNewFile *.mtxs		if &ft != "" | set ft=xs | endif
