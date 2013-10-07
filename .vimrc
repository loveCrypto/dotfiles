" " line numbering & length
set nu     " show line numbers " turn it off with set nonu
set tw=79  " width of document
set colorcolumn=80 " show a line at position 80
highlight ColorColumn ctermbg=233 " show the colorcolum in wished color
set nowrap " don't automatically wrap on load
set fo-=t  " don't automatically wrap text when typing

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Rebind <Leader> key
let mapleader = ","

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

" " Indent automatically depending on filetype
" " filetype indent on
set autoindent
" set cindent

" " SEARCH ############################
set ignorecase " Case insensitive search
set smartcase  " if there is a capital letter in the search expression it 
               " will case sensetive 
set hls        " Higlhight search
set incsearch

" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" " Useful settings                                                               
set history=700                                                              
set undolevels=700   

" Quick quit command                                                            
noremap <Leader>q :quit<CR>  " Quit current window                           
noremap <Leader>Q :qa!<CR>   " Quit all windows  
noremap <Leader>w :w<CR>  " Quit current window                           
noremap <Leader>W :wa!<CR>   " Quit all windows  
noremap <Leader>wq :wq<CR>  " Quit current window                           
noremap <Leader>WQ :wqa!<CR>   " Quit all windows  

" " Wrap text instead of being on one line
 set lbr

" " Change colorscheme 
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod
"colorscheme delek 

" Real programmers don't use TABs but spaces
set tabstop=4 " " how many blanks a tab is
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

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

" " search live
set incsearch

" " autowrite
" set autowrite

" " show invisible signs
" set list
set background=dark 

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

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
let g:jedi#related_names_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Python folding
" " mkdir -p ~/.vim/ftplugin
" " wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable
