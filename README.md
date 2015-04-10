# My Emacs Config #

## Dependencies ##

I'm assuming that paradox is installed somewhere under
`~/.emacs/elpa`. The configuration makes heavy use of
`paradox-require` so this needs to already work before you begin.

I use `xmpfilter` for ruby to evaluate the buffer and insert the
result. For instructions on how to set this up take a look at
[Avdi Grimm's (free) ruby tapas episode](http://devblog.avdi.org/2013/06/24/rubytapas-freebie-xmpfilter/).
I'm assuming that `rcodetools.elc` is somewhere in your emacs load
path (which probably means under `~/.emacs.d/compiled` if you're using
this config).

I'm using the font [`Input`](http://input.fontbureau.com/).

## Installation ##

Check out this git repo and run

    make

This will symlink `~/.emacs` to the init file in this repo and then
compile the source files under `src` into a single `.elc` file and
copy it to `~/.emacs.d/compiled`.

If a `~/.emacs` file already exists it will move it out of the way
first to avoid overwriting it.

## Making modifications ##

Edit files under the `src` directory and then hit `C-c C-c` to rerun
make. This will concatenate the files, byte compile the result and
then copy it into place. It doesn't reload the compiled file so make
sure you eval your buffer to pick up any changes.

## Config rebuild April 2015 ##

I completely rebuilt my emacs configuration in April 2015. A lot of it
is copied over from the previous configuration but there are some
notable changes:

### Notable modifications ###
* Default keybindings for windmove. I previously used `meta-<arrow>`
  but this clashes with some modes (e.g., markdown-mode) so I've gone
  back to the less-easily-typed defaults of `shift-<arrow>`.
* Colour tidy-up. I removed the garish region highlight and made some
  of the whitespace highlighting calmer.
* I'm using `fill-column-indicator` to display a dashed line at 80
  characters and `whitespace-mode` to highlight any text that goes
  beyond 100 characters.
* I've switched from powerline to smart-mode-line.
* I'm using `paradox-require` instead of my own custom require or
install code. I should probably be using cask instead.

### Notable additions ###
* Yasnippets. Finally. I cloned
  [Andrea Crotti's snippets collection](https://github.com/AndreaCrotti/yasnippet-snippets)
  into `~/.emacs.d/snippets` to get some useful defaults.
* Properly configured markdown mode.

### Notable deletions ###
* I deleted support for a number of less frequently used (by me) languages,
  including JavaScript. I'll probably end up re-adding a lot of this
  as I come to use them.
