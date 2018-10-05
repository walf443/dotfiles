setup: $(HOME)/.zshenv \
		$(HOME)/.zshrc \
		$(HOME)/.zshrc_custom \
		$(HOME)/.inputrc \
		$(HOME)/.gitconfig \
		$(HOME)/.screenrc \
		$(HOME)/.tmux.conf \
		$(HOME)/.tscreenrc \
		$(HOME)/.vimrc \
		$(HOME)/.vim \
		$(HOME)/.irbrc \
		$(HOME)/.pythonrc.py \
		$(HOME)/.module-setup

$(HOME)/.zshenv:
	ln -s `pwd`/zsh/zshenv $(HOME)/.zshenv

$(HOME)/.zshrc:
	touch $(HOME)/.zshrc

$(HOME)/.zshrc_custom:
	touch $(HOME)/.zshrc_custom

$(HOME)/.inputrc:
	ln -s `pwd`/inputrc $(HOME)/.inputrc

$(HOME)/.gitconfig:
	ln -sf `pwd`/git/gitconfig $(HOME)/.gitconfig

$(HOME)/.screenrc:
	ln -sf `pwd`/screen/screenrc $(HOME)/.screenrc

$(HOME)/.tmux.conf:
	ln -sf `pwd`/tmux/tmux.conf $(HOME)/.tmux.conf

$(HOME)/.tscreenrc:
	ln -sf `pwd`/screen/screenrc $(HOME)/.tscreenrc

$(HOME)/.vimrc:
	ln -sf `pwd`/vim/vimrc $(HOME)/.vimrc

$(HOME)/.vim:
	ln -sf `pwd`/vim $(HOME)/.vim

$(HOME)/.irbrc:
	ln -sf `pwd`/irb/irbrc $(HOME)/.irbrc

$(HOME)/.pythonrc.py:
	ln -sf `pwd`/python/pythonrc.py $(HOME)/.pythonrc.py

$(HOME)/.module-setup:
	ln -sf `pwd`/module-setup $(HOME)/.module-setup

maketags: vim/tags/perlapi.tags \
	vim/tags/ppport.tags

vim/tags/perlapi.tags:
	perl vim/tags/make_perlapi_tags.pl > vim/tags/perlapi.tags

vim/tags/ppport.tags:
	ctags -f vim/tags/ppport.tags --language-force=c `perldoc -ml Devel::PPPort`

phpref:
	curl -o php_manual_ja.tar.gz http://jp.php.net/get/php_manual_ja.tar.gz/from/this/mirror
	tar xvzf php_manual_ja.tar.gz
	test -e vim/ref/php_manual_ja_html && rm -rf vim/ref/php_manual_ja_html/
	mv html vim/ref/php_manual_ja_html

