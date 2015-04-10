this_dir=`pwd`

install: initfile sources

initfile:
	test -f ~/.emacs && mv ~/.emacs ~/.emacs.pre-setup
	ln -s $(this_dir)/init ~/.emacs

sources:
	cd src && $(MAKE)
