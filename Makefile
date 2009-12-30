setup: $(HOME)/.zshenv \
	   $(HOME)/.zshrc \
	   $(HOME)/.zshrc_custom \
	   $(HOME)/.gitconfig \
	   $(HOME)/.screenrc \
	   $(HOME)/.vimrc \
	   $(HOME)/.vim \
	   $(HOME)/.irbrc \
	   $(HOME)/.pythonrc.py \
	   $(HOME)/.module-setup


$(HOME)/.zshenv:
	ln -s `pwd`/zsh/zshenv $(HOME)/.zshenv

$(HOME)/.zshrc:
	touch  $(HOME)/.zshrc

$(HOME)/.zshrc_custom:
	touch $(HOME)/.zshrc_custom

$(HOME)/.gitconfig:
	ln -sf `pwd`/git/config $(HOME)/.gitconfig

$(HOME)/.screenrc:
	ln -sf `pwd`/screen/screenrc $(HOME)/.screenrc

$(HOME)/.vimrc:
	ln -sf `pwd`/vim/vimrc $(HOME)/.vimrc

$(HOME)/.vim:
	ln -sf `pwd`/vim $(HOME)/.vim

$(HOME)/.irbrc:
	ln -sf `pwd`/irb/irbrc $(HOME)/.irbrc

$(HOME)/.pythonrc:
	ln -sf `pwd`/python/pythonrc.py $(HOME)/.pythonrc.py

$(HOME)/.module-setup:
	ln -sf `pwd`/module-setup $(HOME)/.module-setup

phpref:
	wget http://jp.php.net/get/php_manual_ja.tar.gz/from/this/mirror
	tar xvzf php_manual_ja.tar.gz
	test -e vim/ref/php_manual_ja_html && rm -rf vim/ref/php_manual_ja_html/
	mv html vim/ref/php_manual_ja_html

