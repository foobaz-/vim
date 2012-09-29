"=====================================================================
"////////////////////////////// VIMRC ////////////////////////////////
"=====================================================================


call pathogen#infect()      " pathogen manages the runtimedir


"=====================================================================
" Startup
"=====================================================================
if has('gui_running')
  set guifont=Monospace\ 10
  colorscheme muon
else
  set t_Co=256                      " set 256 colors for terminal
  " this is thanks to the plugin guicolorscheme,
  " which tries to convert gvim themes to 256 color terminals
  " http://www.vim.org/scripts/script.php?script_id=1809
  colorscheme muon
endif

"=====================================================================




"=====================================================================
" AutoCommands
"=====================================================================
" AutoCommand for Python files:
" Highlight all lines which do not have a multiple of 4 spaces in
" front of the first non-whitespace-character.
autocmd BufEnter,BufNew *.py highlight FalseIndent ctermbg=green guibg=red
autocmd BufEnter,BufNew *.py match FalseIndent /\v^((.*(^(( {4})*\S.*$)|(^$)|(^\s*$)).*)@!).*/
"=====================================================================




"=====================================================================
" Basic Settings
"=====================================================================
let mapleader=","                   " change mapleader to comma rather than de default backslash \
syntax on                           " enable syntax highlighting
filetype on                         " also required for latex suite
filetype plugin on                  " also required for latex suite
filetype indent on                  " also required for latex suite
"colorscheme mustang                 " set colorscheme, residing in .vim/color
set nocompatible                    " no vi compatibility
set shiftwidth=4                    " number of spaces to autoindent
set tabstop=4                       " number of spaces for a tabstop
set expandtab                       " expand tab to spaces in insert mode
set autoindent                      " enable autoindenting
set number                          " view line numbers
set showmode                        " show current mode
set ruler                           " always show cursor position
set nocursorline                    " have a line indicate cursor position
set showcmd                         " display incomplete commands on lower right
set hidden                          " edit another buffer while another one is unsaved IMPORTANT!
set lazyredraw                      " don't update the display while executing macros
"set cpoptions=ces$                 " $ on cw ce etc. WARNING: yields a error
                                    "message together with snipmate
set laststatus=2                    " always show status line
set clipboard+=unnamed              " for simple copypasting (doesn't work somehow). clipboard is still reg +
set autoread                        " automatically read a file that has changed on disk
set ofu=syntaxcomplete#Complete     " autocompletion so that menu will always appear
set wildmenu                        " enable wildmenu
set wildmode=list:longest,full      " how wild mode should behave
set foldmethod=syntax               " how Vim should fold
set guioptions-=T                   " remove toolbar in gVim
set hlsearch                        " highlight search results, see mapping for disable highlighting
set incsearch                       " set incremental search
set ignorecase                      " ignores case while searching
set smartcase                       " if a search contains a upper case char, make search case sensitive
set diffopt=vertical                " always split vertical with :diffsplit otherfile
"set ch=3                           " command line is 3 rows in height
set tags=./tags,./../tags,./*/tags  " tell vim how tag files are called and where
                                    " they are located
"=====================================================================




"=====================================================================
" AutoCommands
"=====================================================================
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
"=====================================================================




"=====================================================================
" My Mappings
"=====================================================================
" my mappings and commands
" automatically change directory
" may cause problems together with plugins
" set autochdir
" CDC = Change to Directory of Current file
" command CDC cd %:p:h

" change to dir of file in buffer
nmap <silent> ,cd :lcd %:h<CR>

"=================================
" NERDTree
"=================================
" f2 for enable/disable nerd tree
nmap <F2> :NERDTreeToggle<CR>
"=================================

" map jk to escape in insert mode
inoremap jk <Esc>

" + will create an empty line above the cursor, - under the cursor
nnoremap <M-k> maO<esc>`a
nnoremap <M-j> mao<esc>`a

" Y copies to EOL much like D, C etc. yy is still for yanking a whole line
nmap Y y$

" temporarily disable highlighting
nmap <silent> <leader>nh :silent nohlsearch<CR>

" navigate windows with C-H C-J C-K C-L
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

"=================================
" Lusty Juggler
"=================================
" launch lusty juggler
" 1 2 3 4 ..., a s d f ... map to the corresponding buffer
" default is <leader>lj
nnoremap <leader>b :LustyJuggler<CR>
"=================================
" Lusty Explorer
"=================================
" "filesystem current"
nnoremap <leader>fc :LustyFilesystemExplorerFromHere
" "filesystem home"
nnoremap <leader>fh :LustyFilesystemExplorer
"=================================

"=================================
" Fuzzy Finder -- disabled because of command-t and lusty
"=================================
" see website of fuzzyfinder for much more options
" nnoremap <leader>fb :FufBuffer<CR>
" nnoremap <leader>ff :FufFile<CR>
" nnoremap <leader>ft :FufTag<CR>
"=================================

" toggle show vertical and horizontal line at cursor position
" useful for keeping track of indentation in python files
nnoremap <C-\> :set invcursorcolumn invcursorline<CR>

" show registers
nmap <leader>r :reg<CR>

" copy paste from system clipboard
nmap <leader>y "+y
nmap <leader>p "+p
nmap <leader>Y "+yy

" allow command line editing like emacs
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-N> <End>
cnoremap <C-P> <Up>

map <space> 10jzz
map <BS> 10kzz

" Maps to make handling windows a bit easier
" from derek wyatt's vimrc
"noremap <silent> ,h :wincmd h<CR>
"noremap <silent> ,j :wincmd j<CR>
"noremap <silent> ,k :wincmd k<CR>
"noremap <silent> ,l :wincmd l<CR>
"noremap <silent> ,sb :wincmd p<CR>
"noremap <silent> <C-F9>  :vertical resize -10<CR>
"noremap <silent> <C-F10> :resize +10<CR>
"noremap <silent> <C-F11> :resize -10<CR>
"noremap <silent> <C-F12> :vertical resize +10<CR>
"noremap <silent> ,s8 :vertical resize 83<CR>
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>
"noremap <silent> ,cc :close<CR>
"noremap <silent> ,cw :cclose<CR>
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J
"noremap <silent> <C-7> <C-W>>
"noremap <silent> <C-8> <C-W>+
"noremap <silent> <C-9> <C-W>+
"noremap <silent> <C-0> <C-W>>

"" make directory
"nmap <silent> ,md :!mkdir -p %:p:h<CR>
"=====================================================================




"=====================================================================
" My Abbrevations -- disabled, should be task of snipmate
"=====================================================================
"" make a block comment
"iab com2 /*<CR>/<Up><CR><esc>O
"" make curly braces underneath the cursor and start inserting there
"iab crl {<CR>}<Esc>O
"
"" some java stuff
"iabbr siso System.out.println("");<esc>2hi
"iabbr siserr System.err.println("");<esc>2hi
""iabbr main public static void main(String[] args)<CR>{<CR>}<Esc>O
"iabbr forl for(int i = 0; i < MARK; i++) {<CR>}<Esc>O<esc>?MARK<CR>cw
"iabbr tryb try {<CR>} catch (Exception ex) {<CR> ex.printStackTrace();<CR>}<esc>hx3ko
""iabbr const public static final int
"=====================================================================




"=====================================================================
" Some stuff recommended for Vim Latex Suite
"=====================================================================
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
"=====================================================================




"=====================================================================
" Some settings for minibug explorer
"=====================================================================
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"=====================================================================




"=====================================================================
" Some settings for zencoding plugin
"=====================================================================
let g:user_zen_expandabbr_key = '<c-y>'
let g:use_zen_complete_tag = 1
"=====================================================================

"=====================================================================
" Settings for EasyTags
"=====================================================================
" EasyTags should only create project specific tag files
" relative to the current working directory.
" IMPORTANT: EasyTags will store the files in the first dir given in
" the :set tags=... option.
" therefore ./tags has to be the first name in that list!
let g:easytags_dynamic_files = 2
"=====================================================================



"=====================================================================
" Settings for Vjde, the Vim Java IDE Plugin
"=====================================================================
" tab for vim jde completion, instead of C-x C-u
"let g:vjde_tab_cfu=1
"=====================================================================




"=====================================================================
" Some general reminders
"=====================================================================
" add this to ~/.bash_aliases. gvimrc can now be used to open files
" to an existing gvim session. i.e. :sh in gvim, cd to files, gvimrs *
" to edit all files in the existing session. exit shell with 
" alias gvimrs='gvim --remote-silent'
"
" plugins should be kept in ~/.vim/bundle in their own subdirectory.
" they will get loaded by pathogen => no messy vim directory.
"=====================================================================




"=====================================================================
" Installed Plugins besides the ones which come with vim-gnome
"=====================================================================

"=================================
" MiniBufExplorer
"=================================
" Search on vim.org
"=================================

"=================================
" Vjde - Java IDE
"=================================
" Search on vim.org
"=================================

"=================================
" Vim-Latex / Latex suite
"=================================
" Search on vim.org / Google
"=================================

"=================================
" snipMate
"=================================
" i_<C-R>TAB for a menu with the available snippets for the current filetype
" Search on vim.org
"=================================

"=================================
" Surround
"=================================
" Search on vim.org
" :h surround
"=================================

"=================================
" LustyExplorer
"=================================
" Search on vim.org
"=================================

"=================================
" LustyJuggler
"=================================
" Search on vim.org
"=================================

"=================================
" Command-T
"=================================
" recursive fuzzy file system search
" <leader>t
" Search on vim.org
"=================================

"=================================
" EasyMotion
"=================================
" <leader><leader>w
" Search on vim.org
"=================================

"=================================
" AutoClose by Thiago Alves
"=================================
" AutoComplete provide three commands that can be mapped to any key as you want to do that task:
"    1. AutoCloseOn
"    2. AutoCloseOff
"    3. AutoCloseToggle
" http://www.vim.org/scripts/script.php?script_id=2009
"=================================

"=================================
" TComment
"=================================
" V for visual line select, then gc for commenting
" or gc motion
" or gcc for comment out 1 line
" http://www.vim.org/scripts/script.php?script_id=1173
"=================================

"=================================
" FuzzyFinder by Takeshi Nishida
"=================================
" !! REQUIRES L9 VIM SCRIPT !!
" You can launch FuzzyFinder by the following commands:
"  Command           Mode ~
" |:FufBuffer|       - Buffer mode (|fuf-buffer-mode|)
" |:FufFile|         - File mode (|fuf-file-mode|)
" |:FufCoverageFile| - Coverage-File mode (|fuf-coveragefile-mode|)
" |:FufDir|          - Directory mode (|fuf-dir-mode|)
" |:FufMruFile|      - MRU-File mode (|fuf-mrufile-mode|)
" |:FufMruCmd|       - MRU-Command mode (|fuf-mrucmd-mode|)
" |:FufBookmarkFile| - Bookmark-File mode (|fuf-bookmarkfile-mode|)
" |:FufBookmarkDir|  - Bookmark-Dir mode (|fuf-bookmarkdir-mode|)
" |:FufTag|          - Tag mode (|fuf-tag-mode|)
" |:FufBufferTag|    - Buffer-Tag mode (|fuf-buffertag-mode|)
" |:FufTaggedFile|   - Tagged-File mode (|fuf-taggedfile-mode|)
" |:FufJumpList|     - Jump-List mode (|fuf-jumplist-mode|)
" |:FufChangeList|   - Change-List mode (|fuf-changelist-mode|)
" |:FufQuickfix|     - Quickfix mode (|fuf-quickfix-mode|)
" |:FufLine|         - Line mode (|fuf-line-mode|)
" |:FufHelp|         - Help mode (|fuf-help-mode|)
" http://www.vim.org/scripts/script.php?script_id=1984
"=================================

"=================================
" EasyTags by Peter Odding
"=================================
" a global tags file and keeps it up-to-date as you edit files in Vim.
" The tags are also used to perform dynamic syntax highlighting
" of user-defined functions and types.ts/script.php?script_id=3114
" http://www.vim.org/scripThis plug-in automatically creates
"=================================

"=================================
" Pathogen
"=================================
" Manage your 'runtimepath' with ease.  In practical terms,
" pathogen.vim makes it super easy to install plugins and runtime files
" in their own private directories."
" http://www.vim.org/scripts/script.php?script_id=2332
"=================================

"=================================
" zencoding
"=================================
" help for html, css, js etc.
" http://www.vim.org/scripts/script.php?script_id=2981
"=================================

"=================================
" Most awesome color scheme
"=================================
" Mustang from deviantart
"=================================

"=====================================================================
