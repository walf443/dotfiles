setup: git/gitconfig zsh/zshrc
	ln -sf `pwd`/zsh/zshenv $(HOME)/.zshenv
	touch  `pwd`/zsh/custom.zshrc
	ln -sf `pwd`/git/gitconfig $(HOME)/.gitconfig
	ln -sf `pwd`/screen/screenrc $(HOME)/.screenrc
	ln -sf `pwd`/vim/vimrc $(HOME)/.vimrc
	ln -sf `pwd`/vimperator/vimperatorrc $(HOME)/.vimperatorrc
	ln -sf `pwd`/irb/irbrc $(HOME)/.irbrc

