set nocp
execute pathogen#infect()
filetype plugin on
filetype indent on
syntax on

" Split behavior
set splitbelow
set splitright

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
set visualbell " Visual beeps instead of audible beeps

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
