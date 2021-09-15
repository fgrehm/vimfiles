""
"" Thanks:
""   Mislav Marohnić <mislav.net>
""   Gary Bernhardt  <destroyallsoftware.com>
""   Drew Neil       <vimcasts.org>
""   Tim Pope        <tbaggery.com>
""   Janus           <github.com/carlhuda/janus>
""

set encoding=utf-8
source $HOME/.vim/conf/plugins
source $HOME/.vim/conf/dirs

" source $HOME/.vim/conf/defaults
" source $HOME/.vim/conf/autocmd
" source $HOME/.vim/conf/guioptions
" source $HOME/.vim/conf/shortcuts

" -----------------------------------------------------------------------------
"" Theming
set bg=dark
" Show a brighter cursorline
let g:jellybeans_overrides = {
\    'CursorLine': { 'guifg': '',   'guibg': '444444',
\                    'ctermfg': '', 'ctermbg': '000000',
\                    'attr': '' },
\}
colorscheme jellybeans


" -----------------------------------------------------------------------------
"" Random settings

set exrc          " load vimrc from current directory
set secure        " disable unsafe commands in local .vimrc files
set synmaxcol=800 " don't try to highlight long lines
set ruler         " show the cursor position all the time
set showcmd       " show partial commands below the status line
set shell=bash    " avoids munging PATH under zsh
let g:is_bash=1   " default shell syntax
set history=200   " remember more Ex commands
set scrolloff=3   " have some context around the current line always on screen
set number        " show line numbers
set splitright    " vertical split to the right
set splitbelow    " horizontal split to the left
set modelines=1   " let vim look into the first line for file type
set cursorline    " Highlight the current line
syntax on         " enable syntax highlight
" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden
" Clipboard integration with OS
set clipboard=unnamed

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=100

" maps Ctrl+S to save
" Requires (stty stop '') in your bashrc in order to work from the terminal
map <C-s> <Esc>:w<CR>
map <C-S> <Esc>:w<CR>
map! <C-s> <Esc>:w<CR>a
map! <C-S> <Esc>:w<CR>a

" Set font and shortcuts to change
set guifont=Monospace\ 14
command! Bigger  :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)+1', '')
command! Smaller :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)-1', '')
" maps Ctrl+'=' to increase font size
map! <C-=> <Esc>:Bigger<CR>
map! <C--> <Esc>:Smaller<CR>

" Yank till the end of the line with Y
nnoremap Y y$

" disables man page for word under the cursor
nnoremap K <nop>

" Let the comma lead
let mapleader=","

" set the colors when using terminal commands
set noguipty

" set mapping expand the window
noremap <expr> <silent> <Space><Space> ":vertical res<CR>:res<CR>"
noremap <Space>= <C-w>=
noremap <Space>_ <C-w>_

" -----------------------------------------------------------------------------
"" Whitespace

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
set nojoinspaces                  " Use only 1 space after "." when joining lines, not 2

" Joining lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j            " Delete comment char when joining commented lines
endif

" Indicator chars
set listchars=tab:▸\ ,trail:•,extends:❯,precedes:❮
set showbreak=↪\
set cpo+=$ " add marker for when changing something

" -----------------------------------------------------------------------------
"" Search / navigation

set hlsearch   " highlight matches
set incsearch  " incremental searching
set ignorecase " searches are case insensitive...
set smartcase  " ... unless they contain at least one capital letter

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" Use Ctrl+t for toggling NERDTree
map <C-t> :NERDTreeToggle<CR>

" ignore files that we dont want to autocomplete
set wildignore+=tmp/**,*.rbc,.rbx,*.scssc,*.sassc,bundle/**,vendor/bundle/**,vendor/cache/**,vendor/gems/**,node_modules/**,pkg/**

" Faster and smarter file scanning
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


" -----------------------------------------------------------------------------
"" Automagic stuff

function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=80
endfunction
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!

  " Avoid showing trailing whitespace when in insert mode
  au InsertEnter * :set listchars-=trail:•
  au InsertLeave * :set listchars+=trail:•

  " Some file types use real tabs
  au FileType {make,gitconfig,go} setl noexpandtab

  " Make sure all markdown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()
  au BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl

  " Remove trailing whitespace on save
  autocmd FileType c,cpp,java,php,go,ruby,python,make,javascript,jsx,coffee,vim,markdown,sass,css,vue,tex,slim autocmd BufWritePre <buffer> %s/\s\+$//e

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json setf javascript

  " Comment C files with // instead of /* ... */
  autocmd FileType c,cpp setlocal commentstring=//\ %s

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

  " Start nerdtree if no files were specified
  au StdinReadPre * let s:std_in=1
  au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  autocmd vimenter * wincmd p

  " mark YAML frontmatter as comment
  " au BufNewFile,BufRead *.{md,markdown,html,xml} sy match Comment /\%^---\_.\{-}---$/

  " magic markers: enable using `H/S/J/C to jump back to
  " last HTML, stylesheet, JS or Ruby code buffer
  " au BufLeave *.{erb,html}      exe "normal! mH"
  " au BufLeave *.{css,scss,sass} exe "normal! mS"
  " au BufLeave *.{js,coffee}     exe "normal! mJ"
  " au BufLeave *.{rb}            exe "normal! mC"
augroup END

map <silent> <C-\> <Plug>Commentary<end>
