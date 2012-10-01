# vimfiles

My vim configuration, tested on Ubuntu 12.04


## Installation

Install font from https://github.com/scotu/ubuntu-mono-powerline for the
[powerline](https://github.com/Lokaltog/vim-powerline) plugin. Then run:

    $ sudo apt-get install vim vim-gnome
    $ git clone https://github.com/fgrehm/vimfiles.git
    $ cd vimfiles && ./setup.sh


## Available plugins (managed through [Vundle](https://github.com/gmarik/vundle))

  * [nanotech/jellybeans.vim](https://github.com/nanotech/jellybeans.vim)
  Dark color scheme

  * [nathanaelkane/vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)
  Displays indent levels in code

  * [Lokaltog/vim-powerline](https://github.com/Lokaltog/vim-powerline)
  Awesome statusline utility

  * [scrooloose/syntastic](https://github.com/scrooloose/syntastic)
  Syntax checking

  * [kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)
  Fuzzy file, buffer, mru, tag, etc finder

  * [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
  Tree explorer

  * [Buffer Explorer](http://www.vim.org/scripts/script.php?script_id=42)

  * [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
  Git wrapper

  * [tpope/vim-repeat](https://github.com/tpope/vim-repeat)
  Enable repeating supported plugin maps with "."

  * [tsaleh/vim-align](https://github.com/tsaleh/vim-align)
  Align blocks of code

  * [tpope/vim-endwise](https://github.com/tpope/vim-endwise)
  Auto add `end` after `if`s, `def`s...

  * [tpope/vim-surround](https://github.com/tpope/vim-surround)
  Quoting/parenthesizing made simple

  * [briandoll/change-inside-surroundings.vim](https://github.com/briandoll/change-inside-surroundings.vim)
  Change the contents of the innermost 'surrounding'

  * [ervandew/supertab](https://github.com/ervandew/supertab)
  Insert mode completions with Tab

  * [scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter)
  Comment blocks of code

  * [jeetsukumaran/vim-filesearch](https://github.com/jeetsukumaran/vim-filesearch)
  Search the local filesystem for files by name or content, using glob or regular expression patterns

  * [matchit](http://www.vim.org/scripts/script.php?script_id=39)
  navigation++ with `%`

  * [ruby-matchit](http://www.vim.org/scripts/script.php?script_id=290)
  `%` navigation for ruby

  * [tpope/vim-rails](https://github.com/tpope/vim-rails)
  Rails power tools

  * [ecomba/vim-ruby-refactoring](https://github.com/ecomba/vim-ruby-refactoring)
  Refactoring tool for Ruby

  * [majutsushi/tagbar](https://github.com/majutsushi/tagbar)
  Displays tags in a window (requires ctags installed)

  * [rodjek/vim-puppet](https://github.com/rodjek/vim-puppet)
  Some Puppet niceties

  * [tpope/vim-cucumber](https://github.com/tpope/vim-cucumber)
  Cucumber runtime files

  * [tpope/vim-haml](https://github.com/tpope/vim-haml)
  Runtime files for Haml, Sass, and SCSS

  * [lunaru/vim-less](https://github.com/lunaru/vim-less)
  LessCSS Syntax support

  * [bbommarito/vim-slim](https://github.com/bbommarito/vim-slim)
  Slim Syntax support

  * [tpope/vim-markdown](https://github.com/tpope/vim-markdown)
  Markdown runtime files

  * [kchmck/vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
  CoffeeScript support for vim

  * [pangloss/vim-javascript](https://github.com/pangloss/vim-javascript)
  Improved javascript indentation

  * [briancollins/vim-jst](https://github.com/briancollins/vim-jst)
  Highlighting and indenting JST/EJS syntax


## Syntax checking with [syntastic](https://github.com/scrooloose/syntastic)

### CoffeeScript and JavaScript

You'll need a `coffee` and a `jslint` executable that you can get with:

    $ sudo apt-get install npm
    $ sudo npm install -g jslint
    $ sudo npm install -g coffee-script


### Puppet

You'll need a `puppet` executable installed that you can get with:

    $ sudo apt-get install puppet

Or as a gem:

    $ gem install puppet

syntastic also provides support for [puppet-lint](https://github.com/rodjek/puppet-lint)
if installed.


## Other features

* Deletes trailing spaces by default when saving files
* Fixed swap / backup / undo dir to keep Guards sane


## Key mappings

Please note that the leader key is currently mapped to `,`

### Plugins

* `<C-p>` fire up CtrlP plugin finder
* `<leader>C` toggle comments

    # TODO: Add others that I usually forget...

### Custom

* `<C-s>` save current buffer on normal or insert mode

* `<F8>` toggle Tagbar

* `<Space><Space>` to maximize buffer
* `<Space>=` to restore buffer

    # TODO: Add others that I usually forget...
