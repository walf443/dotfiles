setup: git/gitconfig zsh/zshenv
	ln -sf `pwd`/zsh/zshenv $(HOME)/.zshenv
	touch  $(HOME)/.zshrc
	touch  $(HOME)/.zshrc_custom
	ln -sf `pwd`/git/gitconfig $(HOME)/.gitconfig
	ln -sf `pwd`/screen/screenrc $(HOME)/.screenrc
	ln -sf `pwd`/vim/vimrc $(HOME)/.vimrc
	ln -sf `pwd`/vim $(HOME)/.vim
	ln -sf `pwd`/vimperator/vimperatorrc $(HOME)/.vimperatorrc
	ln -sf `pwd`/irb/irbrc $(HOME)/.irbrc
	ln -sf `pwd`/python/pythonrc.py $(HOME)/.pythonrc.py

phpref:
	wget http://jp.php.net/get/php_manual_ja.tar.gz/from/this/mirror
	tar xvzf php_manual_ja.tar.gz
	test -e vim/ref/php_manual_ja_html && rm -rf vim/ref/php_manual_ja_html/
	mv html vim/ref/php_manual_ja_html
