elc_dir=$(HOME)/.emacs.d/compiled
SOURCES=*.el

$(elc_dir)/combined.elc: combined $(elc_dir)
	emacs -Q -batch -f batch-byte-compile combined
	mv combined.elc $(elc_dir)

combined: $(SOURCES)
	cat $(SOURCES) > combined

$(elc_dir):
	mkdir $(elc_dir)
