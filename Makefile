setup: git/gitconfig zsh/zshrc
	ln -sf `pwd`/zsh/zshrc $(HOME)/.zshrc
	ln -sf `pwd`/git/gitconfig $(HOME)/.gitconfig
	ln -sf `pwd`/screen/screenrc $(HOME)/.screenrc
