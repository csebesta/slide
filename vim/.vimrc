set nocp
filetype plugin on
filetype indent on
syntax on

" Install vim-plug if it does not exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  silent !clear
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | quit
endif

" Plugins
call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
call plug#end()

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Goyo settings
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set wrap
  set linebreak
endfunction

" Limelight settings
let g:limelight_conceal_ctermfg = 10

" Split behavior
set splitbelow
set splitright

" Line navigation (Navigate by visual lines)
nnoremap j gj
nnoremap k gk

" Split navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" General
set autoindent
set nosmartindent
set encoding=utf-8
set nowrap

" Disable automatic insertion of comment leaders
au FileType * setlocal fo-=c fo-=r fo-=o

" Tab behavior
set shiftwidth=4
set tabstop=4

" Appearance
set number " Show line numbers
set hlsearch " Highlight search results
set incsearch " Search incrementally
set ignorecase " Ignore case while searching
set smartcase " Regard uppercase letters while searching
set showcmd " Show command in lower bar
set cursorline " Highlight current line
set ruler " Display cursor position in status line
set laststatus=2 " Always display satus line
set wildmenu " Show completions for commands
set showmatch " Highlight matching features
set novisualbell " Visual beeps instead of audible beeps
set modeline " Enable modeline reading

" Backspace over indentation
set backspace=indent,eol,start

" Remove hightlighting
nnoremap \ :noh<CR>

" Faster scrolling
set ttyfast
set lazyredraw

" Move netrwhist outside of vim configuration directory
let g:netrw_home=$HOME

" Graphical Vim
if has('gui_running')

	" Start maximized
	set lines=999
	set columns=999

	" Disable toolbar/menubar/srollbars
	set guioptions-=m
	set guioptions-=T
	set guioptions-=r
	set guioptions-=L

	" Hide buttons on the toolbar
	aunmenu ToolBar.SaveAll
	aunmenu ToolBar.LoadSesn
	aunmenu ToolBar.SaveSesn
	aunmenu ToolBar.RunScript
	aunmenu ToolBar.Make
	aunmenu ToolBar.RunCtags
	aunmenu ToolBar.TagJump
	aunmenu ToolBar.FindHelp

	" Colorscheme
	set background=dark
	colorscheme solarized

	" Font
	if has('gui_win32')

		" Choose consolas font
		set guifont=Consolas:h14:b

	else

		"set guifont=Consolas\ 16
		"set guifont=Consolas\ Bold\ 14
		"set guifont=Monospace\ Bold\ 14

	endif

" Console vim
else

	" Solarized theme
	set background=dark
	colorscheme solarized

	" Airline configuration
	let g:airline_symbols_ascii=1

endif

"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" Toggle NERDTree
nnoremap <F12> :NERDTreeToggle<CR>

" Toggle paste
set pastetoggle=<F3>

" Toggle solarized background
call togglebg#map("<F5>")

" Toggle line wrap
map <F2>
\	:set wrap!<CR>

" Save and compile latex document to pdf
" <Bar> separates command sequences
nnoremap <F6>
\	:w<Bar>!pdflatex %:t<CR><CR>

"" Improve ansible yaml
"autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"autocmd FileType yaml setlocal indentkeys-=<:>

" Execute python code
map <F7>
\	:w<Bar>!clear && python3 %<CR>
