set dictionary+=~/.vim/dict/perl.dict

iabbrev self, my ($self, ) = @_;<CR><C-R>=Eatchar('\s')<CR>
iabbrev class, my ($class, ) = @_;<CR><C-R>=Eatchar('\s')<CR>
iabbrev pkg, package ;<CR>use strict;<CR>use warnings;<Up><Up><End><Left>

" for sledge
iabbrev r, $self->r-><C-R>=Eatchar('\s')<CR>
iabbrev rd, return $self->redirect("")<Left><Left><C-R>=Eatchar('\s')<CR>
iabbrev rpa, $self->r->param("")<Left><Left><C-R>=Eatchar('\s')<CR>
iabbrev st, $self->stash->{}<Left><C-R>=Eatchar('\s')<CR>

" for container
iabbrev ct, container('')<Left><Left><C-R>=Eatchar('\s')<CR>
iabbrev ctc, container('conf')-><C-R>=Eatchar('\s')<CR>
iabbrev ctdb, container('db')-><C-R>=Eatchar('\s')<CR>
iabbrev ctdm, container('db_master')-><C-R>=Eatchar('\s')<CR>
iabbrev ctds, container('db_slave')-><C-R>=Eatchar('\s')<CR>
iabbrev ctmo, container('mogile')-><C-R>=Eatchar('\s')<CR>
iabbrev ctmk, container('mogile_key')-><C-R>=Eatchar('\s')<CR>

