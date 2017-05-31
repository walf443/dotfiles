setlocal dictionary+=~/.vim/dict/perl.dict

iabbrev self, my ($self, ) = @_;<Left><Left><Left><Left><Left><Left><Left><C-R>=Eatchar('\s')<CR>
iabbrev selfs, my $self = shift;<CR><C-R>=Eatchar('\s')<CR>
iabbrev class, my ($class, ) = @_;<Left><Left><Left><Left><Left><Left><Left><C-R>=Eatchar('\s')<CR>
iabbrev classs, my $class = shift;<CR><C-R>=Eatchar('\s')<CR>
iabbrev pkg, package ;<CR>use strict;<CR>use warnings;<Up><Up><End><Left>
iabbrev strict, use strict;<CR>use warnings;<CR><C-R>=Eatchar('\s')<CR>

" for sledge
iabbrev r, $self->r-><C-R>=Eatchar('\s')<CR>
iabbrev rd, return $self->redirect("")<Left><Left><C-R>=Eatchar('\s')<CR>
iabbrev rp, $self->r->param("")<Left><Left><C-R>=Eatchar('\s')<CR>
iabbrev st, $self->stash->{}<Left><C-R>=Eatchar('\s')<CR>

" for container
iabbrev ct, container('')<Left><Left><C-R>=Eatchar('\s')<CR>
iabbrev ctc, container('conf')-><C-R>=Eatchar('\s')<CR>
iabbrev ctdb, container('db')-><C-R>=Eatchar('\s')<CR>
iabbrev ctdm, container('db_master')-><C-R>=Eatchar('\s')<CR>
iabbrev ctds, container('db_slave')-><C-R>=Eatchar('\s')<CR>
iabbrev ctmo, container('mogile')-><C-R>=Eatchar('\s')<CR>
iabbrev ctmk, container('mogile_key')-><C-R>=Eatchar('\s')<CR>
iabbrev ctca, container('cache')-><C-R>=Eatchar('\s')<CR>
iabbrev ctck, container('cache_key')-><C-R>=Eatchar('\s')<CR>
iabbrev ctdt, container('dt')-><C-R>=Eatchar('\s')<CR>

" testing
iabbrev subtest, subtest "" => sub {<CR><CR>done_testing;<CR>};<Up><Up><Up><Home><Right><Right><Right><Right><Right><Right><Right><Right><Right><C-R>=Eatchar('\s')<CR>

" for gf with "Foo::Bar->" or "qw(Foo::Bar)"
" SEE ALSO: http://subtech.g.hatena.ne.jp/motemen/20110208/1297142489
setlocal includeexpr=substitute(substitute(substitute(v:fname,'::','/','g'),'[-/]\\?$','.pm',''),'^q[qw]\\?/','','')
" PerlLocalLibPath
