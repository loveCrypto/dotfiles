" " line numbering & length
set nu     " show line numbers " turn it off with set nonu
set tw=79  " width of document
set colorcolumn=80 " show a line at position 80
highlight ColorColumn ctermbg=233 " show the colorcolum in wished color
set nowrap " don't automatically wrap on load
set fo-=t  " don't automatically wrap text when typing

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on
syntax enable

" " Indent automatically depending on filetype
" " filetype indent on
set autoindent
" set cindent

" " SEARCH ############################
set ignorecase " Case insensitive search
set smartcase  " if there is a capital letter in the search expression it 
               " will case sensetive 
set hls        " Higlhight search
set incsearch  " search live

" " Useful settings                                                               
set history=700                                                              
set undolevels=700   

" " LEADER SHORT CUTS #########################################################

" Rebind <Leader> key
let mapleader = ","

" Quick quit command                                                            
noremap <Leader>q :q!<CR>  " Quit current window                           
noremap <Leader>Q :qa!<CR>   " Quit all windows  
noremap <Leader>w :w<CR>  " Quit current window                           
noremap <Leader>W :wa!<CR>   " Quit all windows  
noremap <Leader>wq :wq<CR>  " Quit current window                           
noremap <Leader>WQ :wqa!<CR>   " Quit all windows  

" Removes highlight of your last search
noremap <Leader>n :nohl<CR>
vnoremap <Leader>n :nohl<CR>
inoremap <Leader>n :nohl<CR>

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" GUndo 
nnoremap <leader>g :GundoToggle<CR>
" #############################################################################

" " Wrap text instead of being on one line
 set lbr

" " Change colorscheme 
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
" set t_Co=256
" color wombat256mod
" colorscheme delek 
 colorscheme solarized 
 let g:solarized_termcolors=256


" Real programmers don't use TABs but spaces
set tabstop=4     " how many blanks a tab is
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set shiftround    " round indent to multiple of 'shiftwidth'
set expandtab     " insert spaces when hitting TABs

" " 
set title
set scrolloff=3

" set backupdir=~/.vim-temp
" set directory=~/.vim-temp

" Copy & Paste
set pastetoggle=<F3>
set clipboard=unnamed


" " bells are terrible
set noerrorbells
" " set visualbell

"set mousehide
set mouse=a
set guioptions=a
 
" " Necessary for multiple encodings
set encoding=utf-8
set fileencoding=utf-8

" " Common code for encodings
function! SetFileEncodings(encodings)
	let b:myfileencodingsbak=&fileencodings
	let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
	let &fileencodings=b:myfileencodingsbak
	unlet b:myfileencodingsbak
endfunction

" " .NFO specific
au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()

" " Spell Checking
map <F8> :w!<CR>:!ispell %<CR>:e! %<CR>
"set spell spelllang=de


" " autowrite
" set autowrite

" " show invisible signs
" set list
set background=dark 

"trim trailing whitespace
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" use Omnicompletion
set omnifunc=syntaxcomplete#Complete

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation



" ===========================================================
"                          PLUGINS
" ===========================================================

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/folder
call pathogen#infect()

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp
" " cd ~/.vim/bundle
" " git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for jedi-vim
" " cd ~/.vim/bundle
" " git clone git://github.com/davidhalter/jedi-vim.git
"let g:jedi#related_names_command = "<leader>z"
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Python folding
" " mkdir -p ~/.vim/ftplugin
" " wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" Pyflakes
" Shows unused imports in red & invalid syntax
" " cd ~/.vim/bundle
" " git clone https://github.com/mitechie/pyflakes-pathogen.git
" let g:pyflakes_use_quickfix = 0

" PyDoc
" cd ~/.vim/bundle
" git clone https://github.com/fs111/pydoc.vim.git pydoc
" usage is <Leader>pw

" Gundo
" a better undo editor
" cd ~/.vim/bundle
" git clone https://github.com/sjl/gundo.vim.git gundo

" Snippets
" tab completion
" cd ~/.vim/bundle
" git clone https://github.com/msanders/snipmate.vim.git snipmate

" Surround.vim
" Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML
" tags, and more. The plugin provides mappings to easily delete, change and add
" such surroundings in pairs.
" cd ~/.vim/bundle
" git clone https://github.com/tpope/vim-surround.git surround

" Nerdtree
"

" YouCompleteMe
" YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for
" Vim.
" cd ~/.vim/bundle
" git clone https://github.com/Valloric/YouCompleteMe.git youcompleteme
" cd youcompleteme
" git submodule update --init --recursive
" ./install.sh

" Colors ######################################################################
" vim colors solarized
"
" cd ~/.vim/bundle
" git clone git://github.com/altercation/vim-colors-solarized.git
